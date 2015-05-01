require 'sinatra'
require 'sinatra/activerecord'
require 'json'

get '/json' do
  content_type :json
  
  {'wine'=>'cheese'}.to_json
end

get '/' do
  "API format: /json?image_dimensions=400,200,600,800,900,100&bounding_box=200,200"
end