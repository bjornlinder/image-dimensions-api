require File.expand_path '../test_helper.rb', __FILE__

class MyTests < MiniTest::Unit::TestCase

  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index
    get '/'
    assert last_response.ok?
    assert_equal "API format: /json?image_dimensions=400,200,600,800,900,100&bounding_box=200,200", last_response.body
  end
end