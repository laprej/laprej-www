require 'knitr-ruby'

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
