# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'csv'

actors = CSV.parse(File.read("small/actors.csv"), headers: true)
movies = CSV.parse(File.read("small/movies.csv"), headers: true)
movie_actors = CSV.parse(File.read("small/movie_actors.csv"), headers: true)

actors.each do |a|
  Actor.create(IMBD_ID: a["id"].to_i, name: a["name"], birth: a["birth"])
end

movies.each do |m|
  Movie.create(IMBD_ID: m["id"].to_i, title: m["title"], year: m["title"])
end

movie_actors.each do |ma|
  MovieActor.create(actor_id: ma["person_id"].to_i, movie_id: ma["movie_id"].to_i)
end
