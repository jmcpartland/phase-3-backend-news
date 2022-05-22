
class GetData < ActiveRecord::Base
    
    # this class is for extracting data from a local json file and create a seed file with the data.
    
    require 'json'

    def self.grab
        file = File.read('news-api-data.json')
        @news = JSON.parse(file)
    end

    def self.source_seed
        self.grab
        news_seeding = @news['articles'].map {|x| "Source.create(name: '#{x['source']['name']}')"}.uniq.join("\n")
        seed_file = File.open('seed_file.rb', 'a') { |f| f.write news_seeding }
    end


    def self.seedMe
        self.grab
        
        @news["articles"].each do |x|
            # puts x
            
            Article.create( 
                author: x["author"],
                source: x["source"]["name"],
                title: x["title"], 
                description: x["description"], 
                url: x["url"], 
                url_to_image: x["urlToImage"], 
                published_at: x["publishedAt"], 
                content: x["content"]
            )
        end
    end



# Figure out a way to escape character's such as ' in the titles fields

    def sourceId (s)
        temp = Source.find_by(name: s)
        temp["id"]
    end 

    def self.article_seed
        self.grab
        news_seeding = @news['articles'].each do |x|
            Article.update(source_id: sourceId(x["source"]["name"])
        end

        seed_file = File.open('seed_file.rb', 'a') { |f| f.write news_seeding }
    end

end