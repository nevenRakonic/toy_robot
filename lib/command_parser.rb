class CommandParser
  # Parses commands into a format that can be sent as a message to an object
  def initialize(commands)
    @commands = commands
  end

  def parse_commands
    @commands.map { |command| parse_command(command) }
  end

  private

    def parse_command(command)
      parsed_command = command.split(" ").map { |c| c.downcase! }
      method_name = parsed_command.first
      if parsed_command.size > 1
        args = parsed_command.last.split(",")
      end
      [method_name, args]
    end
end
