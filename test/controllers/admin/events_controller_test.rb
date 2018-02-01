require 'test_helper'

class Admin::EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_events_index_url
    assert_response :success
  end

end
