# Application Overview
- A rails application that uses an AI search algorithm to find the shortest path of movies that link two provided actors. Users of the app can create movie playlists and obtain detailed information on movies and actors contained within the provided database.  

# User Stores
- A user should be able to sign up and log in via email or Github account

- A user should be able to search and obtain detailed information about actors and movies found within the database. 

- A user should be be able to leave a movie review on a movies show page
- A user shoule be able to remove a movie review that belongs to them

- A user should be able to create a playlist
- A user can add and remove movies from thier playlist
- A user can delete a playlist

- A user should be able to use the AI search algorithm to reveal a path between two provided actors
- A user should be able to remove AI paths from their saved collection

# Models

## User
### attributes
- email
- username
- password_digest
- uid (used for Github sign in)
- timestamps (created_at, updated_at)

### associations
- has many paths

- has many playlists

- has many reviews
- has many movies, through reviews


## Actor
### attributes
- name
- birth
- tmdb_id
- timestamps (created_at, updated_at)

### associations
- has many movie_actors
- has many movies through movie_actors

- has many path_actors
- has many paths, through path_actors

## Movie
### attributes
- year
- title
- tmdb_id
- timestamps (created_at, updated_at)

### associations
- has many playlist_movies
- has many playlists, through playlist_movies

- has many movie_actors
- has many actors, through movie_actors

- has many path_movies
- has many paths, throught path_movies

- has many reviews
- has many users, through reviews

## Playlist
### attributes
- name
- user_id
- timestamps (created_at, updated_at)

### associations
- belongs to a user

- has many playlist_movies
- has many movies, through playlist movies

## Playlist_Movies (Join)
### attributes
- playlist_id
- movie_id

### associations
- belongs to playlist 
- belongs to movie

## Movie_Actors (Join)
### attributes
- actor_id, primary key: tmdb_id
- movie_id, primary key: tmdb_id
- timestamps (created_at, updated_at)

### associations
- belongs to actor
- belongs to movie

## Path
### attributes
- name
- user_id

### associations
- belongs to user

- has many path_movies
- has many path_actors

- has many movies, through path_movies
- has many actors, through path_actors 

## Path_Actors (Join)
### attributes
- path_id
- actor_id

### associations
- belongs to path 
- belongs to actor

## Path_Movies (Join)
### attributes
- path_id
- movie_id

### associations
- belongs to path 
- belongs to movie

## Review
### attributes
- movie_id
- user_id
- user_review (submittable attribute)

### associations
- belongs to user
- belongs to movie