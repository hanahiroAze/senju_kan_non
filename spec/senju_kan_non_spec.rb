require "spec_helper"

RSpec.describe SenjuKanNon do
  it "has a version number" do
    expect(SenjuKanNon::VERSION).not_to be nil
  end

  describe "#redeem" do
    subject do
      SenjuKanNon.redeem(issai)
    end

    context "invalid params" do
      let(:issai) do
        1
      end

      it "return false" do
        is_expected.to eq(false)
      end
    end

    context "valid params" do
      let(:issai) do
        { first: [1,2,3], second: ["a","b","c"] }
      end

      it "return Array" do
        expect(subject.kind_of?(Array)).to eq(true)
      end

      it "return pairwised Array" do
        expect(subject.count).to eq(9)
      end
    end

    context "valid 3_params" do
      let(:issai) do
        { first: [1,2,3], second: ["a","b","c"], third: ["A","B","C"] }
      end

      it "return Array" do
        expect(subject.kind_of?(Array)).to eq(true)
      end

      it "return pairwised Array" do
        expect(subject.count).to eq(15)
      end
    end

    context "valid 4_params" do
      let(:issai) do
        { first: [1,2,3], second: ["a","b","c"], third: ["A","B","C"], forth: [9, 8, 7] }
      end

      it "return Array" do
        expect(subject.kind_of?(Array)).to eq(true)
      end

      it "return pairwised Array" do
        expect(subject.count).to eq(21)
      end
    end

    context "valid different size params" do
      let(:issai) do
        { first: [1,2], second: ["a","b","c"] }
      end

      it "return Array" do
        expect(subject.kind_of?(Array)).to eq(true)
      end

      it "return pairwised Array" do
        expect(subject.count).to eq(6)
      end
    end

    context "valid different params" do
      let(:issai) do
        { first: [1,2,3,4],
          second: ["a"],
          third: ["b"],
          forth: ["c"]
        }
      end

      it "return Array" do
        expect(subject.kind_of?(Array)).to eq(true)
      end

      it "return pairwised Array" do
        expect(subject.count).to eq(4)
      end
    end

    context "default setting" do
      let(:issai) do
        { first: [1,2,3,4],
          second: ["a"],
          third: ["b"],
          forth: ["c"]
        }
      end
      SenjuKanNon.config.file_output = false

      it "to be default setting" do
        expect(SenjuKanNon.config.file_output).to eq(false)
        expect(SenjuKanNon.config.file_output_path).to eq("test/senju_kan_non/")
        expect(SenjuKanNon.config.file_output_extension).to eq("txt")
        expect(SenjuKanNon.config.use_file).to eq(false)
      end

      it "not to output file" do
        expect{ subject }.to change{ Dir.glob("#{SenjuKanNon.config.file_output_path}*").count }.by(0)
      end
    end

    context "enable file output" do
      let(:issai) do
        { first: [1,2,3,4],
          second: ["a"],
          third: ["b"],
          forth: ["c"]
        }
      end

      it "output file" do
        SenjuKanNon.config.file_output = true
        expect{ subject }.to change{ Dir.glob("#{SenjuKanNon.config.file_output_path}*").count }.by(1)
      end
    end
  end
end
