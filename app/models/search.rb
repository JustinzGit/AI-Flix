class Search < ApplicationRecord
  include SearchUtilities
  require 'set'

  def self.neighbors_for_actor(actor)
    actor = Actor.find(actor)
    neighbors = Set.new

    actor.movies.each do |movie|
      movie.actors.each do |actor|
        neighbors.add([actor, movie])
      end
    end
    neighbors
  end

  def self.organize_path(source, path)
    path.reverse
    length = path.length
    path.unshift([nil, source])
    string = ""
    length.times do |i|
      string += "#{path[i][1].name} and #{path[i + 1][1].name} starred in #{path[i + 1][0].title} "
    end
    string
  end

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
      neighbors = self.neighbors_for_actor(node.state.id)
      neighbors.each do |actor, movie|

        # If actor is not in explored set or fronteir
        if !explored.include?(actor) && !fronteir.contains_state(actor)
          child = Node.new(actor, node, movie)

          # Check if child node is goal
          if child.state == target
            path = {movies: [], actors: []}

            while child.parent
              path[:movies].unshift(child.action)
              path[:actors].unshift(child.state)
              child = child.parent
            end
            path[:actors].unshift(source)
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
