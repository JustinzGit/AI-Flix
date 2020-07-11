# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'csv'

actors = CSV.parse(File.read("tmdb_dataset/actors.csv"))
columns = actors.shift
columns[0] = "tmdb_id"
columns.map! &:to_sym
Actor.import columns, actors

movies = CSV.parse(File.read("tmdb_dataset/movies.csv"))
columns = movies.shift
columns[0] = "tmdb_id"
columns.map! &:to_sym
Movie.import columns, movies

movie_actors = CSV.parse(File.read("tmdb_dataset/movie_actors.csv"))
columns = movie_actors.shift
columns[1] = "actor_id"
columns[0] = "movie_id"
columns.map! &:to_sym
MovieActor.import columns, movie_actors
