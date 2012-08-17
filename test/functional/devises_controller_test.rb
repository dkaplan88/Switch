require 'test_helper'

class DevisesControllerTest < ActionController::TestCase
  setup do
    @devise = devises(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:devises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create devise" do
    assert_difference('Devise.count') do
      post :create, devise: { name: @devise.name }
    end

    assert_redirected_to devise_path(assigns(:devise))
  end

  test "should show devise" do
    get :show, id: @devise
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @devise
    assert_response :success
  end

  test "should update devise" do
    put :update, id: @devise, devise: { name: @devise.name }
    assert_redirected_to devise_path(assigns(:devise))
  end

  test "should destroy devise" do
    assert_difference('Devise.count', -1) do
      delete :destroy, id: @devise
    end

    assert_redirected_to devises_path
  end
end
