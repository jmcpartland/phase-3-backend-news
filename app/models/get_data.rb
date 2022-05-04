class GetData < ActiveRecord::Base
    
    # this class is for extracting data from a local json file and create a seed file with the data.
    
    require 'json'

    def self.grab
        file = File.read('news-api-data.json')
        data_hash = JSON.parse(file)
    end
end