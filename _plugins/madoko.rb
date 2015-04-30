require 'fileutils'
require 'pry'

module Jekyll
  
  module Converters
    
    class Madoko < Converter
      
      safe true
      priority :high
      
      def matches(ext)
        ext =~ /^\.mdk$/
      end
      
      def output_ext(ext)
        ".html"
      end
      
      def convert(content)
        # setup
        
        out = ""
        Tempfile.create(['jekyll','.mdk']) do |t|
          # convert frontmatter to Madoko...
          mdk_content = content.gsub(/\A---(.*?)^---$/m,'\\1')
          puts mdk_content.gsub(/^/,'| ')
          t.write(mdk_content)
          t.close
          cmd = "madoko --fragment --odir=#{File.dirname(t.path)} --verbose #{t.path}"
          puts "@> #{cmd}"
          system(cmd)
          html = t.path.gsub(/\.mdk$/,'.html')
          puts "@> #{html}"
          # binding.pry
          out = File.open(html, 'r').read
          FileUtils.rm(Dir.glob(t.path.gsub(/.mdk$/,'*')))
        end
        
        out
      end
      
    end
    
  end
  
end
