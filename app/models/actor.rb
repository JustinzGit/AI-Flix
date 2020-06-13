class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  has_many :path_actors
  has_many :paths, through: :path_actors

  self.primary_key = "IMBD_ID"

  def self.get_actor_id(actor)
    api_key = ENV['tmdb_api_key']
    response = Faraday.get "https://api.themoviedb.org/3/search/person?api_key=#{api_key}&language=en-US&query=#{actor}"
    response = JSON.parse response.body
    response['results'].empty? ? nil : response['results'][0]['id']
  end

  def self.get_actor_data(actor_id)
    api_key = ENV['tmdb_api_key']
    response = Faraday.get "https://api.themoviedb.org/3/person/#{actor_id}?api_key=#{api_key}&language=en-US"
    response = JSON.parse response.body
    actor_data = {
      name: response['name'],
      birthday: response['birthday'],
      deathday: response['deathday'],
      biography: response['biography'],
      birthplace: response['place_of_birth'],
      image: response['profile_path'],
      imdb_id: response['imdb_id']
    }
  end

  def self.get_actor(actor)
    actor_id = self.get_actor_id(actor)
    self.get_actor_data(actor_id)
  end

  def self.find_by_name(name)
    where("name LIKE (?)", "%#{name}%")
  end

  def self.find_by_birth_year(year)
    where("birth == (?)", year)
  end

  def self.find_actors(name, birth_year)
    actors = self.find_by_name(name)
    actors = actors.where("birth == (?)", birth_year)
  end
end
