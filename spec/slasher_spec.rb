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

  describe "#strip_elements" do
    let(:html) { File.open("spec/fixtures/test.html").read }
    let(:slasher) { Slasher.new(html) }

    it "will remove element but not with the content" do
      slasher.strip_elements
      document = Capybara.string(slasher.document)
      expect(document).not_to have_css "blockquote"
      expect(document).to have_content "This is quote"
      expect(document).not_to have_css "strong"
      expect(document).to have_content "This is strong"
      expect(document).not_to have_css "a"
      expect(document).to have_content "This is a link"
      expect(document).not_to have_css "ul"
      expect(document).not_to have_css "li"
      expect(document).to have_content "This is no. 1"
      expect(document).to have_content "This is no. 2"
      expect(document).not_to have_css "em"
      expect(document).to have_content "This is italic sentence"
      expect(document).not_to have_css "ol"
      expect(document).to have_content "This is first point"
      expect(document).to have_content "This is second point"
    end
  end

end
