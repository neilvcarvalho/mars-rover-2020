require './rover.rb'

describe Rover do
	before(:each) do
		@rover = Rover.new
	end

	it "should initialize at position 0,0" do
		@rover.x.should == 0
		@rover.y.should == 0
	end

	it "should spin 90 degress clockwise if asked to turn right" do
		@rover.heading = "N"
		@rover.turn_right
		@rover.heading.should == "E"
		@rover.turn_right
		@rover.heading.should == "S"
		@rover.turn_right
		@rover.heading.should == "W"
		@rover.turn_right
		@rover.heading.should == "N"
	end
	it "should spin 90 degress counterclockwise if asked to turn left" do
		@rover.heading = "N"
		@rover.turn_left
		@rover.heading.should == "W"
		@rover.turn_left
		@rover.heading.should == "S"
		@rover.turn_left
		@rover.heading.should == "E"
		@rover.turn_left
		@rover.heading.should == "N"
	end
	it "should move 1 spot forward if asked to move" do
		@rover.heading = "N"
		@rover.x = 5
		@rover.y = 5
		@rover.move_forward
		@rover.x.should == 5
		@rover.y.should == 6
		@rover.heading = "E"
		@rover.move_forward
		@rover.x.should == 6
		@rover.y.should == 6
	end
	it "should not move to a negative spot" do
		@rover.turn_left
		lambda {@rover.move_forward}.should raise_error
	end

	it "should move freely after an input that does not start with a digit" do
		rover = Rover.input("3 3 E")
		rover = Rover.input("MMRMMRMRRM")
		rover.x.should == 5
		rover.y.should == 1
		rover.heading.should == "E"
	end

	it "should instantiate a new rover at the desired position if the input starts with a digit" do
		rover = Rover.input("5 5 N")
		rover.should be_an_instance_of(Rover)
		rover.x.should == 5
		rover.y.should == 5
		rover.heading.should == "N"
	end
end