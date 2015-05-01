require_relative 'test_helper.rb'

include Rack::Test::Methods

def app
  Sinatra::Application
end

def instructions
  "API format: /json?image_dimensions=400,200,600,800,900,100&bounding_box=200,200"
end

describe 'root path' do
  it 'returns instructions for the api' do
    get '/'
    assert last_response.ok?
    assert_equal instructions, last_response.body
  end
end

describe 'json api' do
  it 'should return instructions if params don\'t match' do
    get 'json'
    assert_equal instructions, last_response.body
  end
  context 'testing api params' do
    queries = [
      {'request'=>{
          'image_dimensions'=>'400,200',
          'bounding_box'=>'200,200'},
       'expected-response'=>{
          'scaled_dimensions'=> '200,100',
          'scaled_dimensions'=>'200,100'}
      }]
    dimensions = '400,200' "json?image_dimensions=#{dimensions}&bounding_box=200,200'
    request = "json?image_dimensions=#{dimensions}&bounding_box=200,200"
    it 'should return scaled dimensions if request is good' do
      queries.each do |q|
        dimensions = query['request']['image_dimensions']
      get request
      assert_equal query['expected-response'], last_response.body
    end
  end
end