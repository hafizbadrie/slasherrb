describe Slasher::DOM do
  describe "#initialize" do
    let(:html) { "<html><head><title>Hello World</title></head><body><h1>Hello World</h1></body></html>" }

    it "will assign document based on provided data in initialisation" do
      dom = Slasher::DOM.new(html)
      document = Nokogiri::HTML(html)
      expect(dom.document).to be_a Nokogiri::HTML::Document
    end
  end

  describe "#remove_elements" do
    let(:html) { File.open("spec/fixtures/test.html").read }
    let(:dom) { Slasher::DOM.new(html) }

    it "will remove elements like script, iframe, style, noscript, header, footer, br, and img" do
      dom.remove_elements
      document = Capybara.string(dom.document)
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
    let(:dom) { Slasher::DOM.new(html) }

    it "will remove element but not with the content" do
      dom.strip_elements
      document = Capybara.string(dom.document)
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

  describe "#get_paragraphs_content" do
    let(:html) { File.open("spec/fixtures/test_paragraph.html").read }
    let(:dom) { Slasher::DOM.new(html) }

    it "will get all the content inside tag p from specific parent" do
      content = dom.get_paragraphs_content(dom.document.xpath("//div[@class='content']"))
      expect(content).to eq "This is first paragraph.This is second paragraph.This is third paragraph."

      content = dom.get_paragraphs_content(dom.document.xpath("//div[@class='sidebar']"))
      expect(content).to eq "This is paragraph"
    end
  end
end
