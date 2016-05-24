Dir["./lib/*.rb"].each { |file| require file }

class Application
  def self.run
    filtered_input = InputFilter.new(gets).filter
    commands = CommandParser.new(filtered_input).parse_commands
    CommandDispatcher.new(commands, Robot.new).run
  end
end
