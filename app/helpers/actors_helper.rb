module ActorsHelper
    def actor_link(name, birth)
        birth = "N/A" if birth.nil?
        "#{name} - Born: #{birth}"
    end 
end
