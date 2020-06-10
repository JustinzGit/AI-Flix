# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'csv'

actors = CSV.parse(File.read("large/actors.csv"))
columns = actors.shift
columns[0] = "IMBD_ID"
columns.map! &:to_sym
Actor.import columns, actors

movies = CSV.parse(File.read("large/movies.csv"))
columns = movies.shift
columns[0] = "IMBD_ID"
columns.map! &:to_sym
Movie.import columns, movies

movie_actors = CSV.parse(File.read("large/movie_actors.csv"))
columns = movie_actors.shift
columns[0] = "actor_id"
columns[1] = "movie_id"
columns.map! &:to_sym
MovieActor.import columns, movie_actors
