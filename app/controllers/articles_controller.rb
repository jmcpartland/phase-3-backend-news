class ArticlesController < ApplicationController

    # REST index
    get '/articles' do
        Article.all.to_json
    end

    post '/articles' do
        article = Article.create(params).to_json
    end

    delete '/articles/:id' do
        article = Article.find_by(id: params(:id))
        article.destroy
    end

end