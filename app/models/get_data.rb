
class GetData < ActiveRecord::Base
    
    # this class is for extracting data from a local json file and create a seed file with the data.
    
    require 'json'

    def self.grab
        file = File.read('news-api-data.json')
        @news = JSON.parse(file)
    end

    def self.article_seed
        self.grab
        news_seeding = @news['articles'].map {|x| "Article.create(source: '#{x['source']['name']}'),"}.uniq.join("\n")
        seed_file = File.open('seed_file.rb', 'w') { |f| f.write news_seeding }
    end

end