class CommandDispatcher

  def initialize(commands, robot)
    @commands = commands
    @robot = robot
  end

  def run
    @commands.each do |command|
      method_name = command.first
      args = command.last
      # byebug
      if can_send_command?(method_name)
        @robot.send method_name, *args
      end
    end
  end

  private

    def can_send_command?(method_name)
      @robot.placed? || method_name == "place"
    end
end
