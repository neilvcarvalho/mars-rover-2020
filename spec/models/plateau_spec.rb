describe Plateau do
  describe "#upper_limit" do
    it "is the first argument of its initializer" do
      plateau = Plateau.new(1, 2)
      expect(plateau.upper_limit).to eq 1
    end
  end

  describe "#right_limit" do
    it "is the second argument of its initializer" do
      plateau = Plateau.new(1, 2)
      expect(plateau.right_limit).to eq 2
    end
  end
end