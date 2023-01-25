require 'test_helper'

class SearchedProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get searched_profiles_index_url
    assert_response :success
  end

end
