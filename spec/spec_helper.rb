require("rspec")
require("pg")
require("line")
require("station")

DB = PG.connect({:dbname => "train_station_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM line *;")
    DB.exec("DELETE FROM station *;")
  end
end
