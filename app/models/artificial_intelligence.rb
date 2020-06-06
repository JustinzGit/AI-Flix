class ArtificialIntelligence < ApplicationRecord
  include AiUtilities
  require 'set'

  def neighbors_for_actor(actor_id)
    actor = Actor.find(actor_id)
    neighbors = Set.new

    actor.movies.each do |movie|
      movie.actors.each do |actor|
        neighbors.add(actor)
      end
    end
    neighbors
  end
end
