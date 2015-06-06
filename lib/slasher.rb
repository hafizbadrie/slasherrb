class Slasher
  REMOVED_ELEMENTS  = ['iframe', 'script', 'style', 'noscript', 'header', 'footer', 'br', 'img']
  STRIPPED_ELEMENTS = ['blockquote', 'strong', 'a', 'ul', 'li', 'em', 'ol']

  attr_accessor :document

  def initialize(document)
    @document = document
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
end
