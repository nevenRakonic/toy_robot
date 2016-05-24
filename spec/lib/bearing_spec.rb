describe Bearing do
  let(:bearing) { Bearing.new("north") }

  describe "#left" do
    it "changes facing position correctly" do
      expect{ bearing.left }.to change{ bearing.facing }.to "west"
    end
  end

  describe "#right" do
    it "changes facing position correctly" do
      expect{ bearing.right }.to change{ bearing.facing }.to "east"
    end
  end

  describe "#to_s" do
    it "converts the object to string with upcased facing" do
      expect(bearing.to_s).to eq "NORTH"
    end
  end
end
