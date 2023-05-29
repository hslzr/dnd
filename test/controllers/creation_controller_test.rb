require "test_helper"

class CreationControllerTest < ActionDispatch::IntegrationTest
  test "should get sheet" do
    get creation_sheet_url
    assert_response :success
  end
end
