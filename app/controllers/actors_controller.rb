class ActorsController < ApplicationController

  def index
    @actors = Actor.all
  end

  def show
    @actor = Actor.find(params[:id])
    @actor = Actor.get_actor(@actor.name)
  end
end
