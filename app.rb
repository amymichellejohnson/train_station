require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/station")
require("./lib/line")
require("pg")


DB = PG.connect({:dbname => "train_station"})

get("/") do
  @lines = Line.all()
  erb(:index)
end

post("/line") do
  line_name = params.fetch("line")
  newline = Line.new({:line_name => line_name, :line_id => nil})
  newline.save()
  @lines = Line.all()
  erb(:index)
end

get("/line/:id") do
  @found_line = Line.find(params.fetch("id").to_i())
  erb(:line)
end

post("/station") do
  line_id = params.fetch("line_id")
  station_name = params.fetch("station_name")
  station = Station.new({:station_name =>station_name, :station_id => nil})
  station.save()
  @found_line = Line.find(line_id.to_i())
  station_id = station.station_id()
  newstation = Station.new({:station_name =>station_name, :station_id => station_id})
  newline = Line.new({:line_name => nil, :line_id => line_id})
  newline.add_station(newstation)
  erb(:line)
end

get("/station/:id") do
  @found_station = Station.find(params.fetch("id").to_i())
  erb(:station)
end
