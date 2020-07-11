class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  has_many :path_actors
  has_many :paths, through: :path_actors

  self.primary_key = "tmdb_id"

  # Search TMDB for actor ID
  def self.get_actor_id(actor)
    api_key = ENV['tmdb_api_key']
    response = Faraday.get "https://api.themoviedb.org/3/search/person?api_key=#{api_key}&language=en-US&query=#{actor}"
    response = JSON.parse response.body
    response['results'].empty? ? nil : response['results'][0]['id']
  end

  # Use actor ID to obtain actor data from TMDB
  def self.get_actor_data(actor_id)
    if actor_id.nil?
      return nil
    else 
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
  end

  # Obtain TMDB data on provided actor 
  def self.get_tmdb_data(actor)
    actor_id = self.get_actor_id(actor)
    self.get_actor_data(actor_id)
  end

  # Find actors with name that contains input
  def self.find_by_name(name)
    where("name LIKE (?)", "%#{name}%")
  end

  # Find actors born in a provided year
  def self.find_by_birth_year(year)
    where("birth == (?)", year)
  end

  # Find actors with the provided name born in a provided year 
  def self.find_actors(name, birth_year)
    actors = self.find_by_name(name)
    actors = actors.where("birth == (?)", birth_year)
  end
end
