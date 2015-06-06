describe Slasher do

  describe "#initialize" do
    let(:html) { "<html><head><title>Hello World</title></head><body><h1>Hello World</h1></body></html>" }

    it "will assign document based on provided data in initialisation" do
      slasher = Slasher.new(html)
      expect(slasher.document).to eq "<html><head><title>Hello World</title></head><body><h1>Hello World</h1></body></html>"
    end
  end

end
