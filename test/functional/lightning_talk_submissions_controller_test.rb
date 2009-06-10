require 'test_helper'

class LightningTalkSubmissionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lightning_talk_submissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lightning_talk_submission" do
    assert_difference('LightningTalkSubmission.count') do
      post :create, :lightning_talk_submission => { }
    end

    assert_redirected_to lightning_talk_submission_path(assigns(:lightning_talk_submission))
  end

  test "should show lightning_talk_submission" do
    get :show, :id => lightning_talk_submissions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => lightning_talk_submissions(:one).to_param
    assert_response :success
  end

  test "should update lightning_talk_submission" do
    put :update, :id => lightning_talk_submissions(:one).to_param, :lightning_talk_submission => { }
    assert_redirected_to lightning_talk_submission_path(assigns(:lightning_talk_submission))
  end

  test "should destroy lightning_talk_submission" do
    assert_difference('LightningTalkSubmission.count', -1) do
      delete :destroy, :id => lightning_talk_submissions(:one).to_param
    end

    assert_redirected_to lightning_talk_submissions_path
  end
end
