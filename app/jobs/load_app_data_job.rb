class LoadAppDataJob < ApplicationJob
    queue_as :default

    def perform
        Ai.load_data
    end 
end 