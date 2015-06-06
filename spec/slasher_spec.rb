describe Slasher do

  describe "#initialize" do
    let(:html) { "<html><head><title>Hello World</title></head><body><h1>Hello World</h1></body></html>" }

    it "will assign document based on provided data in initialisation" do
      slasher = Slasher.new(html)
      expect(slasher.document).to eq "<html><head><title>Hello World</title></head><body><h1>Hello World</h1></body></html>"
    end
  end

  describe "#remove_elements" do
    let(:html) { File.open("spec/fixtures/test.html").read }
    let(:slasher) { Slasher.new(html) }

    it "will remove elements like script, iframe, style, noscript, header, footer, br, and img" do
      slasher.remove_elements
      document = Capybara.string(slasher.document)
      expect(document).not_to have_css "script"
      expect(document).not_to have_css "iframe"
      expect(document).not_to have_css "style"
      expect(document).not_to have_css "noscript"
      expect(document).not_to have_css "header"
      expect(document).not_to have_css "footer"
      expect(document).not_to have_css "br"
      expect(document).not_to have_css "img"
    end
  end

  # describe "#strip_elements" do
  #   let(:html) {  }
  # end

end
