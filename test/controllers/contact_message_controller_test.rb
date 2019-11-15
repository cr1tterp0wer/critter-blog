require 'test_helper'

class ContactMessageControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get contact_message_create_url
    assert_response :success
  end

  test "should get destroy" do
    get contact_message_destroy_url
    assert_response :success
  end

end
