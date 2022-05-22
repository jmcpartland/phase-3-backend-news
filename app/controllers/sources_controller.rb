class SourcesController < ApplicationController

    get '/sources' do
        Source.all.to_json
    end

end