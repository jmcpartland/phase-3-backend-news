class SourcesController < ApplicationController

    # Read
    get '/sources' do
        sources = Source.all
        sources.to_json(include: :articles)
    end

    # Create
    post '/sources' do
        # binding.pry
        source = Source.create(params)
        source.to_json
    end
    

    # Sources show route
    get '/sources/:id' do
        source = Source.find_by(id: params[:id])
        if source
            source.to_json(include: :articles)
        else
            "404 - Source not found"
        end
    end
end