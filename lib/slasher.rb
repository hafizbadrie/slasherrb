require 'slasher/content'
require 'slasher/dom'

class Slasher
  attr_accessor :dom, :content

  def initialize(html)
    @dom      = Slasher::DOM.new(html)
    @content  = Slasher::Content.new
  end

  def recursive_slash(doc)
    doc.children.each do |child|
      if child.send(:>, "p").count > 0
        p_content = dom.get_paragraphs_content(child)
        content.push_content(p_content)
      end

      if child.children.count > 0
        recursive_slash(child)
      else
        if child.text != '' && !child.text.nil?
          content.push_content(child.text)
        end
      end
    end
  end

  def slash
    dom.remove_elements
    dom.strip_elements
    recursive_slash(dom.document)
    content.get_longest_length[:content]
  end
end
