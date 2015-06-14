describe Slasher do

  describe "#initialize" do
    let(:html) { "<html><head><title>Hello World</title></head><body><h1>Hello World</h1></body></html>" }

    it "will assign document based on provided data in initialisation" do
      slasher = Slasher.new(html)
      expect(slasher.dom).to be_a Slasher::DOM
      expect(slasher.content).to be_a Slasher::Content
    end
  end

  describe "#recursive_slash" do
    let(:html) { File.open("spec/fixtures/test_doc.html") }
    let(:slasher) { Slasher.new(html) }

    it "will recursively turn document into array of hash" do
      slasher.recursive_slash(slasher.dom.document)
      content = slasher.content
      expect(content.collection.size).to eq 21
    end
  end

  describe "#slash" do
    let(:html) { File.open("spec/fixtures/test_doc.html") }
    let(:slasher) { Slasher.new(html) }

    it "will return the longest/highest content" do
      content = slasher.slash
      expect(content).to eq "This is first paragraph.This is second paragraph.This is third paragraph."
    end
  end
end
