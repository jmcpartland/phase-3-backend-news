class SourcesController < ApplicationController

    # Souces show route
    get '/sources' do
        sources = Source.all
        sources.to_json(include: :articles)
    end

    # Souces show route
    get '/sources/:id' do
        source = Source.find_by(id: params[:id])
        if source
            source.to_json(include: :articles)
        else
            "404 - Source not found"
        end
    end
end