module Jekyll
    class ApiLeafTag < Liquid::Tag
  
      def initialize(tag_name, input, tokens)
        super
        @input = input
      end
  
      def render(context)
        input = Liquid::Template.parse(@input).render(context)
        input_parts = input.strip.split("|")
  
        name = input_parts[0].strip
        type = input_parts[1].strip
        description = input_parts[2].strip
        code = input_parts[3].strip
        
        output += "<div class='name'>#{name}</div>"
        output = "<div class='api-leaf-box'>"
        output += "<div class='type'>#{type}</div>"
        output += "<div class='description'>#{description}</div>"
        output += "<pre><code>#{code}</code></pre>" if code
        output += "</div>"
  
        output
      end
    end
  end
  
  Liquid::Template.register_tag('apileaf', Jekyll::ApiLeafTag)