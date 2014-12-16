require 'test_helper'

class PromotesControllerTest < ActionController::TestCase
  setup do
    @promote = promotes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:promotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create promote" do
    assert_difference('Promote.count') do
      post :create, promote: {  }
    end

    assert_redirected_to promote_path(assigns(:promote))
  end

  test "should show promote" do
    get :show, id: @promote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @promote
    assert_response :success
  end

  test "should update promote" do
    put :update, id: @promote, promote: {  }
    assert_redirected_to promote_path(assigns(:promote))
  end

  test "should destroy promote" do
    assert_difference('Promote.count', -1) do
      delete :destroy, id: @promote
    end

    assert_redirected_to promotes_path
  end
end
