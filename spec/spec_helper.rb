# Load all lib files
Dir["./lib/*.rb"].each { |file| require file }

# Have byebug readily available
require 'byebug'

module STDINHelper
  # Taken from: https://gist.github.com/nu7hatch/631329
  # Replace standard input with faked one StringIO.
  def fake_stdin(*args)
    begin
      $stdin = StringIO.new
      $stdin.puts(args.shift) until args.empty?
      $stdin.rewind
      yield
    ensure
      $stdin = STDIN
    end
  end
end

RSpec.configure do |config|
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #     # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  config.include(STDINHelper)
end
