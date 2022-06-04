class SourcesController < ApplicationController

    get '/sources' do
        sources = Source.all
        sources.to_json #(include: :articles)
    end

end