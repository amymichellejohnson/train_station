class Station

  attr_reader(:station_name, :station_id)
  define_method(:initialize) do |attributes|
    @station_name = attributes.fetch(:station_name)
    @station_id = attributes.fetch(:station_id)
  end

  define_singleton_method(:all) do
    returned_stations = DB.exec("SELECT * FROM station;")
    station_array = []
    returned_stations.each() do |station|
      station_name = station.fetch("name")
      station_id = station.fetch("id").to_i()
      station_array.push(Station.new({:station_name => station_name, :station_id => station_id}))
    end
    station_array
  end

  define_method(:save) do
    returned_stations = DB.exec("SELECT * FROM station WHERE name='#{@station_name}';")
    if returned_stations.any?()
      return nil
      else station_result = DB.exec("INSERT INTO station (name) VALUES  ('#{@station_name}') RETURNING id;")
      @station_id = station_result.first().fetch("id").to_i()
    end
  end

  define_method(:==) do |another_station|
    self.station_name().==(another_station.station_name()).&(self.station_id().==(another_station.station_id()))
  end

 define_singleton_method(:find) do |id|
    found_station = nil
    Station.all().each() do |station|
      if station.station_id().==(id)
        found_station = station
      end
    end
    found_station
  end

  define_method(:lines) do
    @station_id = self.station_id().to_i()
    returned_stops = DB.exec("SELECT * FROM stops WHERE station_id = #{@station_id};")
    lines_array = []
    returned_stops.each() do |stop|
      @line_id = stop.fetch("line_id").to_i()
      returned_line = DB.exec("SELECT * FROM line WHERE id = #{@line_id};")
      returned_line.each() do |line|
        name = line.fetch("name")
        lines_array.push(Line.new({:line_name => name, :line_id => @line_id}))
      end
    end
    lines_array
  end
end
