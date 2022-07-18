class ArticlesController < ApplicationController

    # Read
    get '/articles' do
        article = Article.all
        article.to_json
    end

    # Create
    post '/articles' do
        article = Article.create(params)
        article.to_json
    end

    # Delete
    delete '/articles/:id' do
        article = Article.find_by(id: params[:id])
        article.destroy
    end

    # Update
    patch '/articles/:id' do
        article = Article.find_by(id: params[:id])
        # binding.pry
        article.update(read: params[:read])
        article.to_json
    end

end