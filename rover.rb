class Rover
	@@last_rover = nil
	attr_accessor :x, :y, :heading
	attr_reader :cardinals

	
	
	def initialize(string="")
		@cardinals = [ "N", "E", "S", "W" ]
		if string == ""
			@x       = 0
			@y       = 0
			@heading = "N"
		else
			split_string = string.split(' ')
			raise ArgumentError, "Invalid cardinal input." unless split_string[2].nil? || @cardinals.include?(split_string[2])
			@x       = split_string[0].to_i
			@y       = split_string[1].to_i
			@heading = split_string[2] || "N"
		end
		@@last_rover = self
	end

	def turn_right
		@heading = @cardinals[@cardinals.find_index(@heading) + 1] || "N"
	end

	def turn_left
		@heading = @cardinals[@cardinals.find_index(@heading) - 1] || "W"
	end

	def move_forward
		@x += 1 if @heading == "E"
		@x -= 1 if @heading == "W"
		@y += 1 if @heading == "N"
		@y -= 1 if @heading == "S"
		if @x < 0 || @y < 0
			@x = 0 if @x < 0
			@y = 0 if @y < 0
			raise StandardError, "Cannot move that way. The rover would fall off the plateau."
		end
	end

	def self.input(string)
		if string =~ /^\d/
			return Rover.new(string)
		elsif string != ""
			string.each_char do |char|
				char.upcase!
				raise StandardError, "You are not controlling any rover. Enter the coordinates as in '0 0 N' (without quotes)" if @@last_rover.nil?
				raise StandardError, "Invalid command." unless ["L", "R", "M"].include?(char)
				@@last_rover.turn_left if char == "L"
				@@last_rover.turn_right if char == "R"
				@@last_rover.move_forward if char == "M"
			end
			puts "#{@@last_rover.x} #{@@last_rover.y} #{@@last_rover.heading}"
			return @@last_rover
		else
			puts "Finished the program."
		end
	end
end