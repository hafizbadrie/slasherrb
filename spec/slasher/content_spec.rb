describe Slasher::Content do
  describe "#initialize" do
    let(:content) { Slasher::Content.new }

    it "will assign document based on provided data in initialisation" do
      expect(content.collection).to be_empty
    end
  end

  describe "#push_content" do
    let(:content_1) { "This is just a content that\nneeds to be stored in a collection" }
    let(:content_2) { "This is just a content" }
    let(:content) { Slasher::Content.new }

    it "will store content in an array of hash" do
      content.push_content(content_1)
      content.push_content(content_2)
      expect(content.collection).to have(2).items
      expect(content.collection.first[:length]).to eq content_1.gsub(/\s/, '').delete("\n").size
      expect(content.collection.first[:content]).to eq content_1.delete("\n")
    end
  end

  describe "#get_longest_length" do
    let(:content) { Slasher::Content.new }
    let(:content_1) { "This is the first content" }
    let(:content_2) { "This should have the highest length among all"}
    let(:content_3) { "Sortest" }

    it "will return highest length from contents" do
      content.push_content(content_1)
      content.push_content(content_2)
      content.push_content(content_3)

      expect(content.get_longest_length[:content]).to eq content_2
    end
  end
end
