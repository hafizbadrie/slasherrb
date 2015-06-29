require 'slasher/content'
require 'slasher/dom'

class Slasher
  attr_accessor :dom, :content

  def initialize(html)
    @dom      = Slasher::DOM.new(html)
    @content  = Slasher::Content.new
  end

  def recursive_slash(doc)
    content.push_content(dom.get_texts(doc))

    doc.children.each do |child|
      if child.send(:>, "p").count > 0
        content.push_content dom.get_paragraphs_content(child)
      end

      if child.children.count > 0
        recursive_slash(child)
      else
        content.push_content(child.text) if child.text != '' && !child.text.nil?
      end
    end
  end

  def reset(html)
    @dom     = Slasher::DOM.new(html)
    @content = Slasher::Content.new
  end

  def slash
    dom.remove_elements
    dom.strip_elements
    recursive_slash(dom.document)
    content.get_longest_length[:content]
  end
end
