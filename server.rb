require 'sinatra'
require 'sinatra/activerecord'
require 'json'

get '/json' do
  content_type :json
  
  {'wine'=>'cheese'}.to_json
end