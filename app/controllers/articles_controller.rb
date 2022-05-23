class ArticlesController < ApplicationController

    # REST index
    get '/articles' do
        Article.all.to_json
    end

end