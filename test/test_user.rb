# test_user.rb
require File.expand_path '../helper.rb', __FILE__

class MyTest < MiniTest::Test

  include Rack::Test::Methods

  def app
    Radical
  end

  def setup
    @user = User.find(1)
  end

  def test_user_exists
    assert_equal "Matt", @user.name
  end
end
