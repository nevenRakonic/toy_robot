describe CommandDispatcher do
  let(:robot) { Robot.new }

  describe "#run" do
    let(:place_first_commands) do
      [["place", ["1","1","north"]], ["move", nil]]
    end
    let(:place_last_commands) do
      [["move", nil], ["left", nil], ["place", ["0","0","north"]]]
    end

    it "sends messages to robot when allowed" do
      dispatcher = CommandDispatcher.new(place_first_commands, robot)
      expect(robot).to receive("move").with no_args
      dispatcher.run
    end

    it "doesn't send messages before place command" do
      dispatcher = CommandDispatcher.new(place_last_commands, robot)
      expect(robot).to_not receive("move")
      expect(robot).to_not receive("left")
      dispatcher.run
    end
  end
end
