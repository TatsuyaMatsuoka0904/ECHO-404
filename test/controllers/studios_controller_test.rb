require 'test_helper'

class StudiosControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get studios_show_url
    assert_response :success
  end

end
