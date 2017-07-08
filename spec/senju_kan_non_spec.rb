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
        expect(subject.count).to eq(11)
      end
      # 1,b,A
      # 2,c,A
      # 1,a,A
      # 3,a,C
      # 2,a,B
      # 1,b,C
      # 1,c,B
      # 2,b,B
      # 2,c,C
      # 3,c,A
      # 3,b,B
    end
  end
end
