require 'open3'
require 'ostruct'

DIR = File.expand_path File.dirname(__FILE__)

module KnitrRuby
  class Knitr < OpenStruct

    def knit(content)
      command = "#{DIR}/knitrscript.R --args #{options}"
      Open3::popen3(command) do |stdin, stdout, stderr, wait_thr|
        stdin.puts content
        stdin.close

        raise StandardError, "Error knitting: #{stderr.read}" if wait_thr.value.exitstatus > 0
        content = stdout.read
      end
    end

    def options
      opts = chunk_options || {}
      opts.map {|k,v| "#{k}=#{v}" }.join(" ")
    end

  end
end

module Jekyll
  module Converters
    class Markdown
      KNITR_CHUNK = "```{r"

      def convert(content)
        setup

        # do extra knitr step if we find a knitr code chunk
        content = knit(content) if content.include? KNITR_CHUNK

        @parser.convert(content)
      end

      # call KnitRuby, provided by knitr-ruby gem
      def knit(content)        
        root = File.expand_path(File.dirname(__FILE__)+"/..")
        Dir.chdir("#{root}/_site")
        
        @knitr = KnitrRuby::Knitr.new(options)
        
        out = @knitr.knit(content)
        
        # fix img links for the figures that were generated
        fig = options['fig.path']
        out = out.gsub(/\]\(#{fig}/, "](#{@config['base']}/#{fig}")
        
        out
      end

      # merge default options and options from _config.yml
      # turn into string with named args, e.g. fig.width=10
      def options
        { 'chunk_options' => {
            "fig.width" => 10,
            "fig.height" => 7,
            "fig.path" => "figure/",
            "dev" => "svg"
          }
        }.merge(@config['knitr'] || {})
      end

    end
  end
end
