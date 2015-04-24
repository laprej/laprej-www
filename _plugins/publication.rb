require 'pry'

module Jekyll
  class Publication < Liquid::Tag

    def initialize(tag_name, tag, tokens)
      super
      @tag = tag.strip
    end
    
    # prepend site.base if absolute path
    def baseify(link, site)
      case link
      when /^\//
        site.config['base']+link
      else
        link
      end
    end
    
    def date(pub)
      pub['venue'] ? pub['venue']['date'] : nil
    end
    
    def venue(pub)
      v = pub['venue']
      if v && v['link']
        %{<a href="#{v['link']}">#{v['name']}</a>}
      elsif v && v['name']
        v['name']
      else
        v
      end
    end
    
    def render(context)
      site = context.registers[:site]
      
      basify = -> link {
        case link
        when /^\//
          site.config['base']+link
        else
          link
        end
      }
      
      pub = site.data['pubs'][@tag]
      
      # binding.pry
      
      icon = { 'paper'=>'file', 'key'=>'blackboard', 'slides'=>'blackboard' }
      links = (pub['links'] || []).map{|k,v|
        %{<a href="#{basify[v]}" class=""><span class="glyphicon glyphicon-#{icon[k]}"></span> #{k.capitalize}</a>}
      }
      
      content = [ "<strong>#{pub['title']}</strong>",
        (pub['authors'] ? pub['authors'].join(', ') : nil),
        [venue(pub), date(pub)].compact.join(' — '),
        links.join(' | ')
      ].compact.join('<br/>')
      
      %{<div class="pub">#{content}</div>}
    end
  end
end

Liquid::Template.register_tag('publication', Jekyll::Publication)
