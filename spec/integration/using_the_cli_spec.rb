describe "Using the CLI" do
  it "works" do
    cli = Session.new

    cli.exec_command Command.new("5 5")
    cli.exec_command Command.new("1 2 N")
    cli.exec_command Command.new("LMLMLMLMM")
    cli.exec_command Command.new("3 3 E")
    cli.exec_command Command.new("MMRMMRMRRM")

    expect(cli.output).to eq ["1 3 N", "5 1 E"]
  end
end