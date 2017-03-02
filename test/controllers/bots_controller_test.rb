require 'test_helper'

class BotsControllerTest < ActionDispatch::IntegrationTest
  test "should get crawl" do
    get bots_crawl_url
    assert_response :success
  end

end
