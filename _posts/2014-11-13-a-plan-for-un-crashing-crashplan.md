---
layout: post
title: "A plan for un crashing CrashPlan"
description: |
  Some tricks for fixing CrashPlan's "unable to connect to backup service" error on Yosemite.
---

CrashPlan is by far my favorite tool for backing up my computers. I'm never able or willing to plug my laptop in to my backup harddrive for long enough for Time Machine to do its job, all of attempts to make Time Machine work over the network (proxied through my always-on desktop) failed. I'm not rich enough to go around buying Apple's Time Capsules or Airport Extremes (I save my money to buy all of Apple's *other* hardware). CrashPlan, on the other hand, has been a great solution because it actually does a good job of backing up over the internet and I can backup between machines that I own at different sites *for free*. However, I've been having problems getting the CrashPlan UI App working for a while.

CrashPlan's documentation was largely unhelpful for diagnosing my problem, so here's some things that I learned and what to look for if you're experiencing similar problems.

## The error:
<img src="{{site.base}}img/crashplan_crash.png" alt="Crash Plan Error Message"/>

In my case, not only was the main CrashPlan app unable to connect to the service, but the CrashPlan MenuBar icon was also greyed out and said it couldn't connect to the backup service.

## The environment:

I have been seeing this from OSX Yosemite, but I did have a problem with this a while back on Mavericks, too, so this may be useful for both. For a while it was intermittent, solved by rebooting, but then it became a problem all the time.

## The solution(s):

CrashPlan's [troubleshooting page](http://support.code42.com/CrashPlan/Latest/Troubleshooting/Unable_To_Connect_To_The_Backup_Engine) for this error had me try a bunch of things, to no avail. Partly, I think it is because of outdated commands for OSX.

*First of all*, restarting the service using `launchctl` didn't make any difference.

*Second*, it wasn't an [out-of-memory crashing problem](http://support.code42.com/CrashPlan/Latest/Troubleshooting/CrashPlan_Runs_Out_Of_Memory_And_Crashes), because the service was still running. To check, I did something like the following (from the Terminal):

    > ps aux | grep CrashPlan
    bholt           56615   0.0  1.9  6066736 155984   ??  S     4:24PM   0:20.74 /Applications/CrashPlan.app/Contents/MacOS/CrashPlan
    root            56587   0.0  0.8  3817772  68128   ??  SNs   4:24PM   0:11.25 /Applications/CrashPlan.app/Contents/MacOS/CrashPlanService -Dapp=CrashPlanService -Xmn10m -Xms15m -Xmx1024m -DappBaseName=CrashPlan -Djava.awt.headless=true -Dfile.encoding=UTF-8 -Djava.net.preferIPv4Stack=true -Dsun.net.inetaddr.ttl=300 -Dnetworkaddress.cache.ttl=300 -Dsun.net.inetaddr.negative.ttl=0 -Dnetworkaddress.cache.negative.ttl=0 -DCP_USER_NAME= -DCP_USER_HOME=/Users/bholt -cp lib/com.backup42.desktop.jar:lang com.backup42.service.CPService CP_USER_NAME= CP_USER_HOME=/Users/bholt
    bholt           56424   0.0  0.1   894428  11484   ??  SN    4:22PM   0:02.09 /Applications/CrashPlan.app/Contents/Helpers/CrashPlan menu bar.app/Contents/MacOS/CrashPlan menu bar
    bholt           59420   0.0  0.0  2451204    696 s006  S+    7:19PM   0:00.00 grep CrashPlan

You can clearly see the CrashPlanService, run by `root`, chugging along.

*Third*, I tried [checking the ports for conflicts](http://support.code42.com/CrashPlan/Latest/Troubleshooting/Known_Conflicts_With_The_CrashPlan_Application#Identify_Other_Port_Conflicts). *Spoiler:* turns out this was actually the problem, but their troubleshooting tips weren't helpful, because it turns out the ports were wrong, and the commands were wrong.

They have you check which apps are using which ports with the command:

    > sudo lsof -i TCP:4243,4242
    >

Which for me returned nil. I had to widen my search:

    > sudo lsof -i TCP | grep CrashPlan
    CrashPlan 56424  bholt   29u  IPv4 0x4c00d1e518e9c329      0t0  TCP localhost:64125->localhost:4243 (ESTABLISHED)
    CrashPlan 56424  bholt   30u  IPv4 0x4c00d1e518e9c329      0t0  TCP localhost:64125->localhost:4243 (ESTABLISHED)
    CrashPlan 56587   root   78u  IPv4 0x4c00d1e51a34efe9      0t0  TCP localhost:4200 (LISTEN)
    CrashPlan 56587   root   91u  IPv4 0x4c00d1e515ec1fe9      0t0  TCP localhost:4200->localhost:64125 (ESTABLISHED)
    CrashPlan 56587   root   92u  IPv4 0x4c00d1e5172918b9      0t0  TCP ###.###.###.###:64222->central.crashplan.com:https (ESTABLISHED)
    CrashPlan 56587   root   93u  IPv4 0x4c00d1e51584e4c9      0t0  TCP localhost:4243->localhost:64089 (ESTABLISHED)
    CrashPlan 56615  bholt   56u  IPv6 0x4c00d1e50ca3ed79      0t0  TCP localhost:64089->localhost:4243 (ESTABLISHED)

Here, I noticed that the CrashPlan service seemed to be trying to use `4200`, not `4234` or `4242`, which is why my other searches turned up nothing. 

I don't know how it happened that CrashPlan was using the wrong ports, but I was able to track down the offending settings that control the ports.

The port the CrashPlan app uses can be controlled by the `servicePort` setting, but by default it is just set to 4243 (notice here it's commented out because it's using the default):

    grep servicePort /Applications/CrashPlan.app/Contents/Resources/Java/conf/ui.properties
    # servicePort=4243

The CrashPlanService, on the other hand, is controlled by a `servicePort` setting in a different configuration file:

    > grep servicePort /Library/Application\ Support/CrashPlan/conf/my.service.xml
        <servicePort>4200</servicePort>

It looks like the MenuBar app was also assuming `4243`, so all I had to do was make sure that they all matched up, by editing the `my.service.xml` file. If you didn't know, you can open a file in its default editor with the `open` command:

    open /Library/Application\ Support/CrashPlan/conf/my.service.xml
    # change line to: <servicePort>4243</servicePort>

And then restart the CrashPlanService using `launchctl`:

    sudo launchctl unload /Library/LaunchDaemons/com.crashplan.engine.plist
    sudo launchctl load /Library/LaunchDaemons/com.crashplan.engine.plist

And then everything has been hunky-dory since!

Hope this helps someone else someday!
