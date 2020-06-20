module ActorsHelper
    def actor_link(name, birth)
        birth = "N/A" if birth.nil?
        "#{name} - Born: #{birth}"
    end
    
    def actor_birthday(actor)
        actor[:birthday].nil? ? "No Data" : format_date(actor[:birthday])
    end 

    def actor_birthplace(actor)
        actor[:birthplace].nil? ? "No Data" : actor[:birthplace]
    end 

    def actor_deathday(actor)
        actor[:deathday].nil? ? "Still Living" : format_date(actor[:deathday])
    end 
end
