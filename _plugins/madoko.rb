require 'fileutils'
require 'pry'

module Jekyll

  class MadokoPage < Page
    def initialize(site, src)
      @site = site
      @base = site.source
      @dir = File.dirname(src)
      @name = File.basename(src, '.mdk')
      
      self.process(@name)
      self.read_yaml()
    end
  end


  class MadokoGenerator < Generator
    
    def generate(site)
      
      
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
