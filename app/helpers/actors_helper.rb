module ActorsHelper
    def actor_link(name, birth)
        birth = "N/A" if birth.nil?
        "#{name} - Born: #{birth}"
    end
    
    def actor_birthday(actor)
        actor[:birthday].nil? ? "No Data" : format_date(actor[:birthday])
    end 
end
