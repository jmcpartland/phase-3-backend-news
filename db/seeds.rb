puts "Seeding..."

require "json"

file = File.read("news-api-data.json")
@news = JSON.parse(file)

def sourceId (s)
    temp = Source.find_by(name: s)
    temp["id"]
end


@news["articles"].each do |x|
        
        Article.create( 
            author: x["author"],
            source: x["source"]["name"],
            # source_id: sourceId(x["source"]["name"]),
            title: x["title"], 
            description: x["description"], 
            url: x["url"], 
            url_to_image: x["urlToImage"], 
            published_at: x["publishedAt"], 
            content: x["content"]
        )
    end

puts "Done seeding!"