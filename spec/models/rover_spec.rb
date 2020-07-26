describe Rover do
  describe "initializer" do
    it "sets the plateau as the first argument" do
      plateau = double("Plateau")
      rover = Rover.new(plateau, 0, 0, "N")

      expect(rover.plateau).to eq plateau
    end

    it "sets the X coordinate as the second argument" do
      plateau = double("Plateau")
      rover = Rover.new(plateau, 1, 0, "N")

      expect(rover.x_coordinate).to eq 1
    end

    it "sets the X coordinate as the third argument" do
      plateau = double("Plateau")
      rover = Rover.new(plateau, 1, 0, "N")

      expect(rover.y_coordinate).to eq 0
    end

    it "sets the orientation as the fourth argument" do
      plateau = double("Plateau")
      rover = Rover.new(plateau, 1, 0, "N")

      expect(rover.orientation).to eq "N"
    end
  end

  describe "#move_forward!" do
    let(:plateau) { Plateau.new(5, 5) }

    context "when facing north" do
      let(:rover) { Rover.new(plateau, 0, 0, "N") }

      it "moves the rover to the square directly north from the current one" do
        expect { rover.move_forward! }.to change { rover.y_coordinate }.by(1)
      end

      it "does not change its X coordinate" do
        expect { rover.move_forward! }.to_not change { rover.x_coordinate }
      end
    end

    context "when facing south" do
      let(:rover) { Rover.new(plateau, 5, 5, "S") }

      it "moves the rover to the square directly south from the current one" do
        expect { rover.move_forward! }.to change { rover.y_coordinate }.by(-1)
      end

      it "does not change its X coordinate" do
        expect { rover.move_forward! }.to_not change { rover.x_coordinate }
      end
    end

    context "when facing east" do
      let(:rover) { Rover.new(plateau, 0, 0, "E") }

      it "moves the rover to the square directly east from the current one" do
        expect { rover.move_forward! }.to change { rover.x_coordinate }.by(1)
      end

      it "does not change its Y coordinate" do
        expect { rover.move_forward! }.to_not change { rover.y_coordinate }
      end
    end

    context "when facing west" do
      let(:rover) { Rover.new(plateau, 5, 5, "W") }

      it "moves the rover to the square directly west from the current one" do
        expect { rover.move_forward! }.to change { rover.x_coordinate }.by(-1)
      end

      it "does not change its Y coordinate" do
        expect { rover.move_forward! }.to_not change { rover.y_coordinate }
      end
    end
  end

  describe "turn_left!" do
    let(:plateau) { Plateau.new(5, 5) }

    context "when facing north" do
      it "changes its orientation to the west" do
        rover = Rover.new(plateau, 5, 5, "N")
        expect { rover.turn_left! }.to change { rover.orientation }.to("W")
      end
    end

    context "when facing south" do
      it "changes its orientation to the east" do
        rover = Rover.new(plateau, 5, 5, "S")
        expect { rover.turn_left! }.to change { rover.orientation }.to("E")
      end
    end

    context "when facing east" do
      it "changes its orientation to the north" do
        rover = Rover.new(plateau, 5, 5, "E")
        expect { rover.turn_left! }.to change { rover.orientation }.to("N")
      end
    end

    context "when facing west" do
      it "changes its orientatino to the south" do
        rover = Rover.new(plateau, 5, 5, "W")
        expect { rover.turn_left! }.to change { rover.orientation }.to("S")
      end
    end
  end

  describe "turn_right!" do
    let(:plateau) { Plateau.new(5, 5) }

    context "when facing west" do
      it "changes its orientation to the north" do
        rover = Rover.new(plateau, 5, 5, "W")
        expect { rover.turn_right! }.to change { rover.orientation }.to("N")
      end
    end

    context "when facing east" do
      it "changes its orientation to the south" do
        rover = Rover.new(plateau, 5, 5, "E")
        expect { rover.turn_right! }.to change { rover.orientation }.to("S")
      end
    end

    context "when facing north" do
      it "changes its orientation to the east" do
        rover = Rover.new(plateau, 5, 5, "N")
        expect { rover.turn_right! }.to change { rover.orientation }.to("E")
      end
    end

    context "when facing south" do
      it "changes its orientatino to the west" do
        rover = Rover.new(plateau, 5, 5, "S")
        expect { rover.turn_right! }.to change { rover.orientation }.to("W")
      end
    end
  end
end