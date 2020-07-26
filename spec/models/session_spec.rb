describe Session do
  describe "#prompt" do
    context "When there is no plateau yet" do
      it "asks for plateau dimensions" do
        set = Session.new

        expect(set.prompt).to eq "Enter plateau dimensions"
      end
    end

    context "When there is a plateau, but no rover to send instructions to" do
      it "asks for rover position" do
        set = Session.new
        set.exec_command(Command.new("5 5"))

        expect(set.prompt).to eq "Enter rover initial position"
      end
    end

    context "When there is a rover to send instructions to" do
      it "asks for rover instruction" do
        set = Session.new
        set.exec_command(Command.new("5 5"))
        set.exec_command(Command.new("1 2 N"))

        expect(set.prompt).to eq "Enter instructions to the rover"
      end
    end
  end

  describe "#exec_command" do
    context "When there is no plateau yet" do
      it "creates a plateau" do
        set = Session.new

        expect { set.exec_command(Command.new("5 5")) }.to change { set.plateau }
      end
    end

    context "When there is a plateau, but no rover to send instructions to" do
      it "sets a new rover as the current rover" do
        set = Session.new
        set.exec_command(Command.new("5 5"))

        expect { set.exec_command(Command.new("1 2 N")) }.to change { set.current_rover }
      end
    end

    context "When there is a rover to send instructions to" do
      it "clears the current rover" do
        set = Session.new
        set.exec_command(Command.new("5 5"))
        set.exec_command(Command.new("1 2 N"))

        expect { set.exec_command Command.new("LMLMLMLMM") }.to change { set.current_rover }.to(nil)
      end

      it "changes the output with the rover position" do
        set = Session.new
        set.exec_command(Command.new("5 5"))
        set.exec_command(Command.new("1 2 N"))

        expect { set.exec_command Command.new("LMLMLMLMM") }.to change { set.output }.to(["1 3 N"])
      end
    end
  end
end