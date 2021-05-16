module ActorsHelper
    def actor_birthday(actor)
        actor.birthday.nil? ? "No Data" : format_date(actor.birthday)
    end 

    def actor_birthplace(actor)
        actor.birthplace.nil? ? "No Data" : actor.birthplace
    end 

    def actor_deathday(actor)
        actor.deathday.nil? ? "Still Living" : format_date(actor.deathday)
    end 

    def display_actors_search_results(results)
        if results
            actors = results.map do |a|
                "#{link_to(a.name, actor_path(a), class: "grey-link")}"
            end
            raw(actors.join) 
        end
    end 

    def display_movies_starred_in(movies)
        movie_count = movies.length

        first_column = movies[0..(movie_count/2)-1].map do |a|
            link_to(a.title, movie_path(a), class: "grey-link centered")
        end
        
        second_column = movies[(movie_count/2)+1..movie_count].map do |a|
            link_to(a.title, movie_path(a), class: "grey-link centered")
        end

        movie_list =  
        """
        <div class='w-col w-col-6'>
            #{first_column.join}
        </div>
        <div class='w-col w-col-6'>
            #{second_column.join}
        </div>
        """

        raw(movie_list)
    end  
end
