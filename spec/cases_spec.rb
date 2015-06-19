describe "Test Cases" do
  let(:slasher) { Slasher.new(html) }

  describe "Liputan 6" do
    let(:html) { File.open("spec/cases/liputan6.html").read }
    let(:expectation) { File.open("spec/cases/liputan6_expectation.txt").read }

    it "will get only the content" do
      content = slasher.slash
      expect(content).to eq expectation.delete("\n")
    end
  end

  describe "Kompas" do
    let(:html) { File.open("spec/cases/kompas.html").read }
    let(:expectation) { File.open("spec/cases/kompas_expectation.txt").read }

    it "will get only the content" do
      content = slasher.slash
      expect(content).to eq expectation.delete("\n")
    end
  end

  describe "Detik" do
    let(:html) { File.open("spec/cases/detik.html").read }
    let(:expectation) { File.open("spec/cases/detik_expectation.txt").read }

    it "will get only the content" do
      content = slasher.slash
      expect(content).to eq expectation.delete("\n")
    end
  end

  describe "The Jakarta Post" do
    let(:html) { File.open("spec/cases/thejakartapost.html").read }
    let(:expectation) { File.open("spec/cases/thejakartapost_expectation.txt").read }

    it "will get only the content" do
      content = slasher.slash
      expect(content).to eq expectation.delete("\n")
    end
  end

  describe "The Jakarta Globe" do
    let(:html) { File.open("spec/cases/thejakartaglobe.html").read }
    let(:expectation) { File.open("spec/cases/thejakartaglobe_expectation.txt").read }

    it "will get only the content" do
      content = slasher.slash
      expect(content).to eq expectation.delete("\n")
    end
  end

  describe "Tribun News" do
    let(:html) { File.open("spec/cases/tribunnews.html").read }
    let(:expectation) { File.open("spec/cases/tribunnews_expectation.txt").read }

    it "will get only the content" do
      content = slasher.slash
      expect(content).to eq expectation.delete("\n")
    end
  end

  describe "Merdeka" do
    let(:html) { File.open("spec/cases/merdeka.html").read }
    let(:expectation) { File.open("spec/cases/merdeka_expectation.txt").read }

    it "will get only the content" do
      content = slasher.slash
      expect(content).to eq expectation.delete("\n")
    end
  end

  describe "Okezone" do
    let(:html) { File.open("spec/cases/okezone.html").read }
    let(:expectation) { File.open("spec/cases/okezone_expectation.txt").read }

    it "will get only the content" do
      content = slasher.slash
      expect(content).to eq expectation.delete("\n")
    end
  end

  describe "Suara" do
    let(:html) { File.open("spec/cases/suara.html").read }
    let(:expectation) { File.open("spec/cases/suara_expectation.txt").read }

    it "will get only the content" do
      content = slasher.slash
      expect(content).to eq expectation.delete("\n")
    end
  end

  describe "Viva" do
    let(:html) { File.open("spec/cases/viva.html").read }
    let(:expectation) { File.open("spec/cases/viva_expectation.txt").read }

    it "will get only the content" do
      content = slasher.slash
      expect(content).to eq expectation.delete("\n")
    end
  end
end
