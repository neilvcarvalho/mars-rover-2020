require_relative "../cli"
require_relative "../mars_rover"

session = Session.new

puts "Welcome to the Mars Rover mission CLI. Enter your commands. When finished,"
puts "press CTRL+C"
begin
  loop do
    print "#{session.prompt}> "
    command = Command.new(gets)
    session.exec_command(command)
  end
rescue Interrupt
  puts
  puts session.output
end