class Station

  attr_reader(:station_name, :station_id, :line_id)
  define_method(:initialize) do |attributes|
    @station_name = attributes.fetch(:station_name)
    @station_id = attributes.fetch(:station_id)
    @line_id = attributes.fetch(:line_id)
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
    station_result = DB.exec("INSERT INTO station (name) VALUES  ('#{@station_name}') RETURNING id;")
    @station_id = station_result.first().fetch("id").to_i()
    DB.exec("INSERT INTO stops (station_id, line_id) VALUES  (#{@station_id}, #{@line_id})")

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

end
