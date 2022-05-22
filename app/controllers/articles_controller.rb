class ArticlesController < ApplicationController

    get '/articles' do
        Article.all.to_json
    end

end