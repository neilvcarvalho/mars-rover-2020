require './rover.rb'
input = " "
puts "Welcome to the Mars Rover controller."
puts "Type your input and press ENTER to send your instruction. A blank input will terminate the program."
while input != ""
	begin
		print "> "
		input = gets.strip
		Rover.input(input.upcase)
	rescue StandardError => bang
		puts bang.message
		retry
	end
end
