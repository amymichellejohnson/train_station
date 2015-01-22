require("spec_helper")

describe(Station) do

  describe(".all") do
    it("is initially empty") do
      expect(Station.all()).to(eq([]))
    end
  end

    describe(".find") do
    it("returns a station by its ID number") do
      test_station = Station.new({:station_name => "Pioneer Square", :station_id => nil})
      test_station.save()
      test_station2 = Station.new({:station_name => "Pioneer Square", :station_id => nil})
      test_station2.save()
      expect(Station.find(test_station2.station_id())).to(eq(test_station2))
    end
  end

  describe("#station_name") do
    it("tells you its name") do
      station = Station.new({:station_name => "Pioneer Square", :station_id => nil})
      station.save()
      expect(station.station_name()).to(eq("Pioneer Square"))
    end
  end

  describe("#station_id") do
    it("sets its ID when you save it") do
      station = Station.new({:station_name => "Pioneer Square", :station_id => nil})
      station.save()
      expect(station.station_id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("saves train station to database") do
    station = Station.new({:station_name => "Pioneer Square", :station_id => nil})
    station.save()
    expect(Station.all()).to(eq([station]))
    end
  end

    describe("#==") do
    it("is the same station if it has the same name") do
      station1 = Station.new({:station_name => "Pioneer Square", :station_id => nil})
      station2 = Station.new({:station_name => "Pioneer Square", :station_id => nil})
      expect(station1).to(eq(station2))
    end
  end

  describe("#lines") do
    it("retrieves all lines for given station") do
      test_line = Line.new({:line_name => "Blue line", :line_id => nil})
      test_line.save()
      test_station = Station.new({:station_name => "Pioneer Square", :station_id =>nil})
      test_station.save()
      test_line.add_station(test_station)
      expect(test_station.lines()).to(eq([test_line]))
    end
  end

end
