Train Station
======================

Methods allow the creation of a searchable train lines and train stations.

Installation
------------

To run the primary application and/or any of the included RSpec files for
testing, run either the included Gemfile or manually
install the following gems:

```ruby
rspec
sinatra
sinatra-contrib
pg
```

To run the included Gemfile, enter the following statements into
the command line:
```ruby
gem install bundler
bundle
```

Ruby v.2.2.0 was used to create this application.

-----

To run PostgreSQL, type the following into the command line of one terminal window:
```PostgreSQL
postgres
```
To create the needed databases, enter the following into
the command line of another terminal window:
psql
CREATE DATABASE train_station;
\c train_station;
CREATE TABLE line (id serial PRIMARY KEY, name varchar);
CREATE TABLE station (id serial PRIMARY KEY, name varchar);
CREATE TABLE stops (id serial PRIMARY KEY, line_id int, station_id int);
CREATE DATABASE train_station_test WITH TEMPLATE train_station;
```
Usage
-----

Upon completion of the above steps in the Installation section, open
up your preferred web browser and enter the following address:

```url
localhost:4567/
```

Enter a line name or station name. Observe the results.

Known Bugs
----------

None as of 2014-01-21.

Author
------

Amy Michelle Johnson & J. TURNER

License
-------

MIT license.
