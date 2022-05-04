class ApplicationController < Sinatra::Base
  
  get "/" do
    { message: "Good luck!" }.to_json
  end

end
