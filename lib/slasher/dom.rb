class Slasher
  class DOM
    REMOVED_ELEMENTS  = ['iframe', 'script', 'style', 'noscript', 'header', 'footer', 'br', 'img']
    STRIPPED_ELEMENTS = ['blockquote', 'strong', 'a', 'em', 'b']

    attr_accessor :document

    def initialize(document)
      @document = Nokogiri::HTML(document)
    end

    def remove_elements
      REMOVED_ELEMENTS.each do |element|
        @document.xpath("//#{element}").remove
      end
    end

    def strip_elements
      STRIPPED_ELEMENTS.each do |element|
        @document.search("//#{element}").each do |node|
          node.replace(Nokogiri::XML::Text.new(node.text, node.document))
        end
      end
    end

    def get_paragraphs_content(node)
      content = ""
      node.send(:>, "p").each do |p|
        content += p.text
        p.remove
      end
      content
    end

    def get_texts(node)
      content = ""
      node.children.each do |child|
        content += child.text.delete("\n").strip if child.text?
      end
      content
    end
  end
end
