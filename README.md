# AI-Flix
AI-Flix at its core is a repository of movies (total of 344,276) and the actors (total of 1,044,499) who have starred in those movies. A function of AI-Flix is to generate the shortest path of movies that connect two provided actors within the database. To accomplish this, AI-Flix uses the Breadth-First Search (BFS) algorithm to traverse a tree of actors and movies until a path is found. 

Inspiration was drawn from "Bacon's Law" or the Six Degrees of Kevin Bacon, a game based on the concept that any two actors can be linked to Kevin Bacon through their film roles within six degrees of separation. [Bacon's Law](https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#:~:text=Six%20Degrees%20of%20Kevin%20Bacon%20or%20%22Bacon's%20Law%22%20is%20a,and%20prolific%20actor%20Kevin%20Bacon.)

Kevin has even started his own charity called [Six Degrees](https://www.sixdegrees.org/about) that has used the popularity of the Bacon's law phenomena to raise money for empowering charities.

All data obtain and displayed in AI-Flix was obtained with permission from [The Movie Database](https://themoviedb.org)

# Installation
- Fork and clone this repository
- Be sure to have RubyGems installed (Ruby version 1.9+ comes with RubyGems by default)
- Be sure to have Rails installed (Rails 6.0.3.1+) [Rails Guide](https://guides.rubyonrails.org/v5.0/getting_started.html)
- Install the ruby gem `bundler` by running `gem install bundler` from the command line
- Install application dependencies by running `bundle install` from the applications main directory
- Run `rails s` from the terminal to start a Rack supported server
- By typing `localhost:3000` into your browser you will access the root page of the application

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/JustinzGit/AI-Flix. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).