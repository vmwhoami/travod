require "test_helper"

class ScrapperControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get scrapper_index_url
    assert_response :success
  end
end
