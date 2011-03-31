require 'test_helper'

class GeneralQuestionsControllerTest < ActionController::TestCase
  setup do
    @general_question = general_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:general_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create general_question" do
    assert_difference('GeneralQuestion.count') do
      post :create, :general_question => @general_question.attributes
    end

    assert_redirected_to general_question_path(assigns(:general_question))
  end

  test "should show general_question" do
    get :show, :id => @general_question.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @general_question.to_param
    assert_response :success
  end

  test "should update general_question" do
    put :update, :id => @general_question.to_param, :general_question => @general_question.attributes
    assert_redirected_to general_question_path(assigns(:general_question))
  end

  test "should destroy general_question" do
    assert_difference('GeneralQuestion.count', -1) do
      delete :destroy, :id => @general_question.to_param
    end

    assert_redirected_to general_questions_path
  end
end
