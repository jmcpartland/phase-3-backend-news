class GetDataController < ApplicationController
    
    get "/getdata" do
      { message: "This is news-api-data.json" }.to_json
      GetData.grab.to_json
    end
  
  end
  