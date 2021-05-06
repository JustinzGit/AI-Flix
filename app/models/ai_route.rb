class AiRoute < ApplicationRecord
  include SearchUtilities
  require 'set'
  require 'csv'

  belongs_to :user
  
  @@names = {}
  @@actors = {}
  @@movies = {}

  # load data from CSV files into memory
  def self.load_data
    actors = CSV.parse(File.read("tmdb_dataset/actors.csv"), headers: true)
    actors.each do |a|
        id = a['id']
        name = a['name']

        @@actors[id] = {
            name: name,
            movies: Set.new
        }

        if !@@names.has_key?(name)
            @@names[name] = id       
        end 
    end 

    movies = CSV.parse(File.read("tmdb_dataset/movies.csv"), headers: true)
    movies.each do |m|
        id = m['id']
        title = m['title']

        @@movies[id] = {
            title: title,
            actors: Set.new
        }
    end 

    movie_actors = CSV.parse(File.read("tmdb_dataset/movie_actors.csv"), headers: true)
    movie_actors.each do |ma|
        actor_id = ma['person_id']
        movie_id = ma['movie_id']

        @@actors[actor_id][:movies] << movie_id
        @@movies[movie_id][:actors] << actor_id
    end 
  end
  
  def self.neighbors_for_actor(actor_id)
    neighbors = Set.new

    # movies actor has starred in
    movie_ids = @@actors[actor_id][:movies]

    movie_ids.each do |movie_id|
        @@movies[movie_id][:actors].each do |actor_id|
          neighbors.add([actor_id, movie_id])
        end 
    end
    return neighbors
  end 

  def self.find_movie_path(source, target)

    # Define the first node
    root_node = Node.new(source, nil, nil)

    # Use Breadth First Search - queue based search
    fronteir = QueueFronteir.new

    # Add root node to fronteir
    fronteir.add(root_node)

    # Initialize empy explored
    explored = Set.new

    # Add source to explored set
    explored.add(root_node.state)

    # Keep looping until solution is found
    while true

      # If fronteir is empty, no path is found
      if fronteir.empty?
        return nil
      end

      # Select node from fronteir
      node = fronteir.remove

      # Check if node neighbors contain target
      neighbors = self.neighbors_for_actor(node.state)

      neighbors.each do |actor, movie|

        # If actor is not in explored set or fronteir
        if !explored.include?(actor) && !fronteir.contains_state(actor)

          child = Node.new(actor, node, movie)

          # Check if child node is goal
          if child.state == target
            movie_path = {movies: [], actors: []}

            while child.parent
              movie_path[:movies].unshift(Movie.find(child.action))
              movie_path[:actors].unshift(Actor.find(child.state))
              child = child.parent
            end
            movie_path[:actors].unshift(Actor.find(source))
            return movie_path
          end

          # Add actor to explored set
          explored << child.state

          # Add child node to fronteir
          fronteir.add(child)
        end
      end
    end
  end
end
