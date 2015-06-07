class Slasher
  REMOVED_ELEMENTS  = ['iframe', 'script', 'style', 'noscript', 'header', 'footer', 'br', 'img']
  STRIPPED_ELEMENTS = ['blockquote', 'strong', 'a', 'ul', 'li', 'em', 'ol']

  attr_accessor :document, :contents

  def initialize(document)
    @document = document
    @contents = []
  end

  def remove_elements
    doc = Nokogiri::HTML(document)
    REMOVED_ELEMENTS.each do |element|
      doc.xpath("//#{element}").remove
    end
    @document = doc.inner_html
  end

  def strip_elements
    doc = Nokogiri::HTML(document)
    STRIPPED_ELEMENTS.each do |element|
      doc.search("//#{element}").each do |node|
        node.replace(Nokogiri::XML::Text.new(node.text, node.document))
      end
    end
    @document = doc.inner_html
  end

  def push_content(content)
    stored_content = {
      length: content.gsub(/\s/, '').size,
      content: content
    }
    @contents << stored_content
  end

  def get_paragraphs_content(node)
    content = ""
    node.send(:>, "p").each do |p|
      content += p.text
    end
    content
  end
end
