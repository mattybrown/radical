# test_ads.rb
require File.expand_path '../helper.rb', __FILE__

class AdTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    Radical
  end

  def setup
    @ad = Ad.last
    @ad_group = AdGroup.last
  end

  def test_adgroup_exists
    get "/agents/#{@ad_group.user.name}"
    assert last_response.ok?
    assert_includes last_response.body, @ad_group.name
  end

  def test_ad_exists
    get "/agents/#{@ad_group.user.name}"
    assert last_response.ok?
    assert_includes last_response.body, @ad.name
  end

end
