require 'test_helper'

class PositionsSearchControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get results" do
    get :results
    assert_response :success
  end

  test "should get detail" do
    get :detail
    assert_response :success
  end

end
