require 'test_helper'

class NotesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get notes_top_url
    assert_response :success
  end

end
