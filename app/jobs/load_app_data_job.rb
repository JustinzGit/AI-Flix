class LoadAppDataJob < ApplicationJob
    queue_as :default

    def perform
        Search.load_data
    end 
end 