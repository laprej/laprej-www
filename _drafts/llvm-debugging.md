---
title: LLVM Debugging Tips and Tricks
layout: post
description: |
  LLVM is a fantastic tool for anyone interested in developing languages, optimizing their code, or even developing first-order architectural simulations. Part of what makes it so great is the wealth of great tools that come with it to help develop and debug passes. Unfortunately not all of them are very well-documented and many are not widely known. In this post I'll describe a few that I stumbled upon which may prove useful — things like printing all the basicblocks/instructions of a function, or inspecting successor/predecessor chains from the debugger (lldb).
---

## Debugging with LLDB

Another trick to keep up your sleeve when working on 

Imagine we want to poke around with something in the middle of our custom pass, to inspect how the data structures look, or chase down some bug. LLDB (LLVM's GDB), is a fantastic tool for playing with live code. It uses LLVM's formidable JIT tooling to interpret and run arbitrary code you give it (much more robustly than GDB ever has for me). This is extremely powerful especially as you're learning the ins and outs of LLVM's massive codebase.

There's just a couple little tricks to getting LLDB to work nicely for us. First, we need to build with Debug symbols. The best way to do this is to tell CMake to enable Debug symbols. Because CMake is CMake, you need to actually blow away your existing `build/` directory and re-configure to change this, this time adding the option `-DCMAKE_BUILD_TYPE=Debug` (if you're worried about performance, you could also do `RelWithDebInfo` — this is the setting we recommend for building all of LLVM, but for my own code it's unlikely I'm doing enough work to worry about performance, at least while debugging).

```
$ LLVM_DIR=/opt/llvm-head/release/share/llvm/cmake cmake .. -DCMAKE_BUILD_TYPE=Debug
```

Let's say we want to play around with the FunctionPass from before and find out more about how Functions are structured. So we want to run our pass with LLDB and set a breakpoint in our code, let's say at line 20, inside our loop over basic blocks.

```cpp
// In file: Skeleton.cpp
virtual bool runOnFunction(Function& fn) {
  errs() << "In function " << fn.getName() << "\n";
  
  for (auto& bb : fn) {
    errs() << "Basic block:\n"; // <- line 20
    bb.dump();
  }
  
  return false;
}
```

First, we need to find out how to launch Clang with the LLDB debugger. It turns out `clang` is actually just a driver which figures out how to launch the correct subprocess to do your compile for you. We can see the commands it invokes using `clang -v`:

```
$ clang -v -Xclang -load -Xclang skeleton/libSkeletonPass.so ~/scratch/test.c
clang version 3.6.0
Target: x86_64-apple-darwin14.4.0
Thread model: posix
 "/opt/llvm-head/release/bin/clang-3.6" -cc1 -triple x86_64-apple-macosx10.10.0 -emit-obj -mrelax-all -disable-free -disable-llvm-verifier -main-file-name test.c -mrelocation-model pic -pic-level 2 -mdisable-fp-elim -masm-verbose -munwind-tables -target-cpu core2 -v -dwarf-column-info -resource-dir /opt/llvm-head/release/bin/../lib/clang/3.6.0 -fdebug-compilation-dir /Users/bholt/hub/llvm-pass-skeleton/build -ferror-limit 19 -fmessage-length 125 -stack-protector 1 -mstackrealign -fblocks -fobjc-runtime=macosx-10.10.0 -fencode-extended-block-signature -fmax-type-align=16 -fdiagnostics-show-option -fcolor-diagnostics -load skeleton/libSkeletonPass.so -o /var/folders/w6/pf2p4_tx1097_3gc9_dl3yr00009sq/T/test-1c7442.o -x c /Users/bholt/scratch/test.c
 ...
```

So, now that we know the command (`clang-3.6 -cc1 ...`), we can run that with LLDB, then we want to set a breakpoint in Skeleton.cpp, line 17 and then we can run the program:

```
> lldb -- "/opt/llvm-head/release/bin/clang-3.6" -cc1 -triple x86_64-apple-macosx10.10.0 -emit-obj -mrelax-all -disable-free -disable-llvm-verifier -main-file-name test.c -mrelocation-model pic -pic-level 2 -mdisable-fp-elim -masm-verbose -munwind-tables -target-cpu core2 -v -dwarf-column-info -resource-dir /opt/llvm-head/release/bin/../lib/clang/3.6.0 -fdebug-compilation-dir /Users/bholt/hub/llvm-pass-skeleton/build -ferror-limit 19 -fmessage-length 125 -stack-protector 1 -mstackrealign -fblocks -fobjc-runtime=macosx-10.10.0 -fencode-extended-block-signature -fmax-type-align=16 -fdiagnostics-show-option -fcolor-diagnostics -load skeleton/libSkeletonPass.so -o /var/folders/w6/pf2p4_tx1097_3gc9_dl3yr00009sq/T/test-1c7442.o -x c /Users/bholt/scratch/test.c
(lldb) breakpoint set -f Skeleton.cpp -l 20
Breakpoint 1: no locations (pending).
WARNING:  Unable to resolve breakpoint to any actual locations.
(lldb) run
Process 79186 launched: '/opt/llvm-head/release/bin/clang-3.6' (x86_64)
1 location added to breakpoint 1
clang -cc1 version 3.6.0 based upon LLVM 3.6.0svn default target x86_64-apple-darwin14.4.0
#include "..." search starts here:
#include <...> search starts here:
 /usr/local/include
 /opt/llvm-head/release/bin/../lib/clang/3.6.0/include
 /usr/include
 /System/Library/Frameworks (framework directory)
 /Library/Frameworks (framework directory)
End of search list.
Process 79186 stopped
* thread #1: tid = 0x11d9b7, 0x00000001030e18d5 libSkeletonPass.so`(anonymous namespace)::SkeletonPass::runOnFunction(this=0x0000000103204a20, fn=0x0000000103501880) + 181 at Skeleton.cpp:20, queue = 'com.apple.main-thread', stop reason = step over
    frame #0: 0x00000001030e18d5 libSkeletonPass.so`(anonymous namespace)::SkeletonPass::runOnFunction(this=0x0000000103204a20, fn=0x0000000103501880) + 181 at Skeleton.cpp:20
   17  	      errs() << "In function " << fn.getName() << "\n";
   18
   19  	      for (auto& bb : fn) {
-> 20  	        errs() << "Basic block:\n";
   21  	        bb.dump();
   22  	      }
   23
(lldb)
```

Notice how at first, it didn't know what were talking about with `Skeleton.cpp` since that module is dynamically loaded by clang later. However, as soon as it was loaded, lldb obediently set the breakpoint we asked for!

Now we can poke around a bit with LLVM. `e` or `p` are just shortcuts for "evaluate expression". Almost everything in LLVM has a `dump()` method, so let's try that:

```
(lldb) e bb.dump()

%1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str, i32 0, i32 0))
ret void

(lldb) e fn.dump()

; Function Attrs: nounwind ssp uwtable
define void @hello() #0 {
  %1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str, i32 0, i32 0))
  ret void
}

```


## Viewing graphs
Another handy tool LLVM provides is automatic DOT graph generation for various objects. For instance, you can print the complete control-flow-graph (CFG) for a function with `Function::viewCFG()`. This is explained more in the programmer's manual, specifically [here](http://llvm.org/docs/ProgrammersManual.html#viewing-graphs-while-debugging-code).

This works particularly well from within LLDB:

```
(lldb) fn.viewCFG()
Writing '/var/folders/w6/pf2p4_tx1097_3gc9_dl3yr00009sq/T/cfghello-6a63ec.dot'...  done.
Running '/usr/local/bin/dot' program...  done.
```

<img src="{{ site.base }}/media/llvm/viewcfg.png" alt="Function::viewCFG()"/>

As with everything else in LLVM, the DOT graph printer is built to be extended, so you can define custom graphs for debugging your passes, or for visualizing the output of your tool. A good place to start looking is in the documentation for [DefaultDOTGraphTraits](http://llvm.org/docs/doxygen/html/structllvm_1_1DefaultDOTGraphTraits.html).

## Getting source/line info for instructions

There are just a couple gotchas with mapping instructions back to their original source code file and line number, so I thought I'd spend a few sentences explaining them.

First, you need another header (this is it's location in my version of LLVM, but they seem to change these paths fairly often so YMMV):

```cpp
#include <llvm/IR/DebugInfo.h>
```

Then you just need to get the metadata for the instruction and extract the location information:

```cpp
Instruction *inst = ...;
MDNode *md = inst->getMetadata("dbg");
DILocation loc(md);
unsigned int line = loc.getLineNumber();
StringRef file = loc.getFilename();
StringRef dir = loc.getDirectory();
```

If you go ahead and try this, odds are good your first run will just say the file is `""` and the line number is `0`. The **big gotcha** here is that you need to instruct Clang/LLVM to generate this metadata, which it only does if you've specified that you want "debug symbols" or "debug info" by passing the `-g` flag (if you're not already in the habit of just always passing this flag to gcc/clang, now's the time to start).

Note: even after running with `-g`, some instructions *still won't have source location metdata*. That's because they don't meaningfully correspond to a line number. This is true for the `alloca` instructions inserted by the compiler for stack variables, and probably for any code you've generated yourself. Or for highly-optimized code. So don't fret if that happens. By the way, if you know a good way to propagate this metadata to code you generate (when it makes sense), please *let me know* because I never figured that out but would love to be able to point back to the originating code from my generated code.

Much more detailed instructions for all of this can be found in the [LLVM Source Level Debugging docs](http://llvm.org/docs/SourceLevelDebugging.html#c-c-source-file-information).

