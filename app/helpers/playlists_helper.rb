module PlaylistsHelper
  def organize_path(playlist)
    movies = playlist.movies
    actors = playlist.actors
    string = ""

    movies.length.times do |i|
      string += "#{actors[i].name} and #{actors[i + 1].name} starred in #{movies[i].title}<br>"
    end
    string.html_safe
  end
end
