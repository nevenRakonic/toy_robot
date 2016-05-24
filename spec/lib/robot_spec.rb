describe Robot do

  let(:robot) { Robot.new }

  describe "#place" do
    context "with valid parameters" do
      before { robot.place(1, 2, 'south') }

      it "sets correct attributes" do
        expect(robot.x).to eq 1
        expect(robot.y).to eq 2
        expect(robot.bearing.facing).to eq 'south'
      end

      it "makes robot placed" do
        expect(robot.placed?).to eq true
      end
    end

    context "with invalid parameter below range" do
      before { robot.place(-1, 2, 'east') }

      it "changes correct attributes" do
        expect(robot.x).to eq nil
        expect(robot.y).to eq nil
        expect(robot.bearing).to eq nil
      end

      it "doesn't make robot placed" do
        expect(robot.placed?).to eq false
      end
    end

    context "with invalid parameter above range" do
      before { robot.place(0, 6, 'east') }

      it "changes correct attributes" do
        expect(robot.x).to eq nil
        expect(robot.y).to eq nil
        expect(robot.bearing).to eq nil
      end

      it "doesn't make robot placed" do
        expect(robot.placed?).to eq false
      end
    end
  end

  describe "#move" do

    it "ignores out of bound moves on y axis" do
      robot.place(0, 0, 'south')
      robot.move

      expect(robot.x).to eq 0
      expect(robot.y).to eq 0
    end

    it "ignores out of bound moves on x axis" do
      robot.place(4, 0, 'east')
      robot.move

      expect(robot.x).to eq 4
      expect(robot.y).to eq 0
    end

    it "increments y for north bearing" do
      robot.place(0, 0, 'north')
      robot.move

      expect(robot.x).to eq 0
      expect(robot.y).to eq 1
    end

    it "decrements y for south bearing" do
      robot.place(0, 4, 'south')
      robot.move

      expect(robot.x).to eq 0
      expect(robot.y).to eq 3
    end

    it "decrements x for west bearing" do
      robot.place(4, 0, 'west')
      robot.move

      expect(robot.x).to eq 3
      expect(robot.y).to eq 0
    end

    it "increments x for east bearing" do
      robot.place(0, 0, 'east')
      robot.move

      expect(robot.x).to eq 1
      expect(robot.y).to eq 0
    end
  end

  context "correctly placed robot" do
    before { robot.place(1, 2, 'south') }

    describe "#right" do
      it "sends the correct message to the bearing object" do
        expect(robot.bearing).to receive(:right)
        robot.right
      end
    end

    describe "#left" do
      it "sends the correct message to the bearing object" do
        expect(robot.bearing).to receive(:left)
        robot.left
      end
    end

    describe "#report" do
      it "prints out formatted information about robots position" do
        expect(STDOUT)
        .to receive(:puts)
        .with("#{robot.x},#{robot.y},#{robot.bearing}")
        robot.report
      end
    end
  end
end
