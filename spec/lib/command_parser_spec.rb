describe CommandParser do

  it "parses commands into a correct format with method names and args" do
    command_parser = CommandParser.new([ "PLACE 0,0,NORTH", "MOVE", "LEFT"])

    expect(command_parser.parse_commands)
    .to eq [["place", ["0","0","north"]],["move", nil],["left",nil]]
  end
end
