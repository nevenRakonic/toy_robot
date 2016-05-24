require './application.rb'

describe Application do

  specify "test case 1" do
    fake_stdin("PLACE 0,0,NORTH MOVE REPORT") do
      expect(STDOUT).to  receive(:puts)
      .with("0,1,NORTH")

      Application.run
    end
  end

  specify "test case 2" do
    fake_stdin("PLACE 0,0,NORTH LEFT REPORT") do
      expect(STDOUT).to  receive(:puts)
      .with("0,0,WEST")

      Application.run
    end
  end

  specify "test case 3" do
    fake_stdin("PLACE 1,2,EAST MOVE MOVE LEFT MOVE REPORT") do
      expect(STDOUT).to  receive(:puts)
      .with("3,3,NORTH")

      Application.run
    end
  end

  specify "commands before place are ignored" do
    fake_stdin("MOVE LEFT NORTH MOVE MOVE PLACE 1,2,EAST MOVE MOVE REPORT") do
      expect(STDOUT).to  receive(:puts)
      .with("3,2,EAST")

      Application.run
    end
  end

  specify "multiple place commands" do
    fake_stdin("PLACE 1,1,WEST MOVE LEFT MOVE MOVE PLACE 4,4,SOUTH MOVE LEFT REPORT") do
      expect(STDOUT).to  receive(:puts)
      .with("4,3,EAST")

      Application.run
    end
  end

  specify "out of table place command" do
    fake_stdin("PLACE 0,0,NORTH MOVE RIGHT MOVE MOVE PLACE 7,8,SOUTH MOVE LEFT REPORT") do
      expect(STDOUT).to  receive(:puts)
      .with("3,1,NORTH")

      Application.run
    end
  end

  specify "out of bound commands" do
    fake_stdin("PLACE 0,4,NORTH MOVE MOVE RIGHT MOVE REPORT") do
      expect(STDOUT).to  receive(:puts)
      .with("1,4,EAST")

      Application.run
    end
  end

  specify "garbled input" do
    fake_stdin("PLACE 0,0,NORTH fdsafds MOVE fsdafdsa REPORT") do
      expect(STDOUT).to  receive(:puts)
      .with("0,1,NORTH")

      Application.run
    end
  end
end
