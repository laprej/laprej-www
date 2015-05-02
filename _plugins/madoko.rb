require 'fileutils'
require 'pry'
require 'securerandom'

module Jekyll

  class MadokoConverter < Converter
    # def initialize(site, src)
    #   @site = site
    #   @base = site.source
    #   @dir = File.dirname(src)
    #   @name = File.basename(src, '.mdk')
    #
    #   self.process(@name)
    #   self.read_yaml()
    # end
    
    safe :false
    priority :high
    
    def matches(ext)
      ext =~ /^\.mdk$/
    end
    
    def output_ext(ext)
      ".html"
    end
    
    def convert(content)
      return content if not content =~ /\A.+:.+$/ # skip if doesn't start with metadata
      dir = Dir.pwd+"/.madoko"
      FileUtils.mkdir_p(dir)
      t = Tempfile.create(['.madoko-','.mdk'], tmpdir=dir)

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

      out = File.open(html, 'r').read
      FileUtils.rm(Dir.glob(t.path.gsub(/.mdk$/,'*')))
      
      out
    end
    
  end


  class MadokoGenerator < Generator
    
    def generate(site)
      
      mdks = site.posts.select{|p| p.name =~ /.mdk$/ }
      
      mdks.each do |p|
        meta = p.data.map{|k,v| "#{k}: #{v}"}.join("\n") + "\n\n"
        p.content.prepend(meta)
        p.excerpt.prepend(meta)
      end
      
      # binding.pry
      
    end
    
  end

end
