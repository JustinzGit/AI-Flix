class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  self.primary_key = "tmdb_id"

  # obtain TMDB actor id
  # def get_actor_id(actor)
  #   api_key = ENV['tmdb_api_key']
  #   response = Faraday.get "https://api.themoviedb.org/3/search/person?api_key=#{api_key}&language=en-US&query=#{actor}"
  #   response = JSON.parse response.body
  #   response['results'][0]['id'] if !response['results'].empty?
  # end

  # fetch data from TMDB
  # if data has not been collected
  def fetch_tmdb_data
      if !self.data_collected
        api_key = ENV['tmdb_api_key']
        response = Faraday.get "https://api.themoviedb.org/3/person/#{self.id}?api_key=#{api_key}&language=en-US"
        response = JSON.parse response.body
        self.birthday = response['birthday']
        self.deathday = response['deathday']
        self.biography = response['biography']
        self.birthplace = response['place_of_birth']
        self.image = response['profile_path']
        self.imdb_id = response['imdb_id']
        self.data_collected = true

        # save data to db
        self.save
      end 
  end

  # find actors with a similar name
  def self.search_by_name(name)
    where("name ILIKE (?)", "%#{name}%") if name
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
