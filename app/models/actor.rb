class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  self.primary_key = "tmdb_id"

  @@api_key = Rails.application.credentials.tmdb_key

  # fetch data from TMDB
  # if data has not been collected
  def fetch_tmdb_data
      if !self.data_collected
        response = Faraday.get "https://api.themoviedb.org/3/person/#{self.id}?api_key=#{@@api_key}&language=en-US"
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
