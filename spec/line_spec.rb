require("spec_helper")

describe(Line) do

  describe(".all") do
    it("is initially empty") do
      expect(Line.all()).to(eq([]))
    end
  end

  describe(".find") do
  it("returns a line by its ID number") do
    test_line = Line.new({:line_name => "Blue line", :line_id => nil})
    test_line.save()
    test_line2 = Line.new({:line_name => "Blue line", :line_id => nil})
    test_line2.save()
    expect(Line.find(test_line2.line_id())).to(eq(test_line2))
  end
end


  describe("#line_name") do
    it("tells you its name") do
      line = Line.new({:line_name => "Blue line", :line_id => nil})
      line.save()
      expect(line.line_name()).to(eq("Blue line"))
    end
  end

  describe("#line_id") do
    it("sets its ID when you save it") do
      line = Line.new({:line_name => "Blue line", :line_id => nil})
      line.save()
      expect(line.line_id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("saves train line to database") do
    line = Line.new({:line_name => "Blue line", :line_id => nil})
    line.save()
    expect(Line.all()).to(eq([line]))
    end
  end

    describe("#==") do
    it("is the same line if it has the same name") do
      line1 = Line.new({:line_name => "Blue line", :line_id => nil})
      line2 = Line.new({:line_name => "Blue line", :line_id => nil})
      expect(line1).to(eq(line2))
    end
  end

  describe("#stations") do
    it("retrieves all stations for given line") do
    test_line = Line.new({:line_name => "Blue line", :line_id => nil})
    test_line.save()
    test_station = Station.new({:station_name => "Pioneer Square", :station_id => test_line.id()})
    test_
    end
  end


end
