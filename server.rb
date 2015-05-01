require 'sinatra'
require 'sinatra/activerecord'
require 'json'
require 'pry-debugger'
require_relative 'scale_dimensions'

get '/json' do
  if params['image_dimensions'] && params['bounding_box']
    results = Dimensions.scale(params['image_dimensions'],params['bounding_box'])
    if results.class == Hash
      content_type :json
      results.to_json
    else
      "Error: #{results.to_s} <br> #{instructions}"
    end
  else
    instructions
  end
end

get '/' do
  instructions
end

def instructions
  "API format: /json?image_dimensions=400,200,600,800,900,100&bounding_box=200,200"
end