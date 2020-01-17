require 'test_helper'

class InsightsControllerTest < ActionDispatch::IntegrationTest
  test "should get get" do
    get insights_get_url
    assert_response :success
  end

end
