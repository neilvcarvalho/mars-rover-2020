describe "Rovers moving on the plateau" do
  it "works" do
    plateau = Plateau.new(5, 5)

    rover1 = Rover.new(plateau, 1, 2, "N")
    rover1.turn_left!
    rover1.move_forward!
    rover1.turn_left!
    rover1.move_forward!
    rover1.turn_left!
    rover1.move_forward!
    rover1.turn_left!
    rover1.move_forward!
    rover1.move_forward!

    expect(rover1.x_coordinate).to eq 1
    expect(rover1.y_coordinate).to eq 3
    expect(rover1.orientation).to eq "N"

    rover2 = Rover.new(plateau, 3, 3, "E")
    rover2.move_forward!
    rover2.move_forward!
    rover2.turn_right!
    rover2.move_forward!
    rover2.move_forward!
    rover2.turn_right!
    rover2.move_forward!
    rover2.turn_right!
    rover2.turn_right!
    rover2.move_forward!

    expect(rover2.x_coordinate).to eq 5
    expect(rover2.y_coordinate).to eq 1
    expect(rover2.orientation).to eq "E"
  end
end