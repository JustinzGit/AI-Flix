class PlaylistsController < ApplicationController

  def new
    @actor = Actor.all
  end
end
