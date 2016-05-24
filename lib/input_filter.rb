class InputFilter
  # Filters STDIN into commands that can be parsed
  COMMAND_REGEX = /(PLACE.\d\,\d,\S+|REPORT|MOVE|LEFT|RIGHT)/

  def initialize(input)
    @input = input
  end

  # Turn input into a filtered array of command strings, which consists only of
  # valid commands
  def filter
    @input.split(COMMAND_REGEX)
          .reject { |command| (command =~ COMMAND_REGEX).nil? }
  end
end
