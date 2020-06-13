class Search < ApplicationRecord
  include SearchUtilities
  require 'set'

  def self.shortest_path(source, target)

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
      # neighbors = self.neighbors_for_actor(node.state)

      movies = Actor.find(node.state).movies.pluck(:IMBD_ID)
      neighbors = Set.new

      movies.each do |movie|
        actors = MovieActor.where("movie_id == #{movie}").pluck(:actor_id)

        actors.each do |actor|
          if !explored.include?(actor) && !fronteir.contains_state(actor)
            neighbors.add([actor, movie])
          end
        end
      end

      neighbors.each do |actor, movie|

        # If actor is not in explored set or fronteir
        if !explored.include?(actor) && !fronteir.contains_state(actor)

          child = Node.new(actor, node, movie)

          # Check if child node is goal
          if child.state == target
            path = {movies: [], actors: []}

            while child.parent
              path[:movies].unshift(Movie.find(child.action))
              path[:actors].unshift(Actor.find(child.state))
              child = child.parent
            end
            path[:actors].unshift(Actor.find(source))
            return path
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
