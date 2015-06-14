class Slasher
  class Content
    attr_accessor :collection

    def initialize
      @collection = []
    end

    def push_content(content)
      stored_content = {
        length: content.gsub(/\s/, '').size,
        content: content
      }
      @collection << stored_content
    end

    def get_longest_length
      collection.sort_by do |content|
        content[:length]
      end.last
    end
  end
end
