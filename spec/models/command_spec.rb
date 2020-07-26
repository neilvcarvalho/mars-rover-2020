describe Command do
  describe "#split_by_spaces" do
    it "returns an array of instructions" do
      command = Command.new("1 2 3")
      expect(command.split_by_spaces).to eq ["1", "2", "3"]
    end

    it "removes extra spaces and line breaks from the input" do
      command = Command.new("1 2 3\r\n")
      expect(command.split_by_spaces).to eq ["1", "2", "3"]
    end
  end

  describe "#split_by_characters" do
    it "returns an array of instructions" do
      command = Command.new("MRMMLMRML")
      expect(command.split_by_characters).to eq "MRMMLMRML".split(//)
    end

    it "removes extra spaces and line breaks from the input" do
      command = Command.new("MRMMLMRML\r\n")
      expect(command.split_by_characters).to eq "MRMMLMRML".split(//)
    end
  end
end