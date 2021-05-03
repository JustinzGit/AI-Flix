module ActorsHelper
    def actor_birthday(actor)
        actor[:birthday].nil? ? "No Data" : format_date(actor[:birthday])
    end 

    def actor_birthplace(actor)
        actor[:birthplace].nil? ? "No Data" : actor[:birthplace]
    end 

    def actor_deathday(actor)
        actor[:deathday].nil? ? "Still Living" : format_date(actor[:deathday])
    end 

    def display_actors_search_results(results)
        if results
            count = "<h3 class='list-title'>We found #{results.count} Actors</h3>"
            actors = results.map do |a|
                "<p>#{link_to(a.name, actor_path(a))}</p>"
            end
            raw(count + actors.join) 
        end
    end 
end
