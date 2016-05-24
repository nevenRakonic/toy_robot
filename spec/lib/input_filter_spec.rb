describe InputFilter do

  describe "#filter" do

    it "transforms input into an array at proper command words" do
      input_filter = InputFilter.new("MOVE LEFT RIGHT PLACE 0,0,NORTH REPORT")
      expect(input_filter.filter).to eq ["MOVE", "LEFT", "RIGHT", "PLACE 0,0,NORTH", "REPORT"]
    end

    it "filters garbled input" do
      input_filter = InputFilter.new("MOVE MOVE jfdsklj PLACE 0,0,NORTH")
      expect(input_filter.filter).to eq ["MOVE", "MOVE", "PLACE 0,0,NORTH"]
    end
  end

end
