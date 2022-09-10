require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get users_path
    assert_response :success
  end
end
