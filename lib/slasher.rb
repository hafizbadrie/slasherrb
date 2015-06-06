class Slasher
  attr_accessor :document
  REMOVED_ELEMENTS = ['iframe', 'script', 'style', 'noscript', 'header', 'footer', 'br', 'img']

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
end
