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

get("/line/:id")
  @found_line = Line.find(params.fetch("id").to_i())

  erb(:line)
end
