require 'test_helper'

class AnimationsControllerTest < ActionController::TestCase
  setup do
    @animation = animations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:animations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create animation" do
    assert_difference('Animation.count') do
      post :create, animation: { cat: @animation.cat, detail: @animation.detail, episodes: @animation.episodes, owner: @animation.owner, sid: @animation.sid, title: @animation.title, uid: @animation.uid }
    end

    assert_redirected_to animation_path(assigns(:animation))
  end

  test "should show animation" do
    get :show, id: @animation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @animation
    assert_response :success
  end

  test "should update animation" do
    patch :update, id: @animation, animation: { cat: @animation.cat, detail: @animation.detail, episodes: @animation.episodes, owner: @animation.owner, sid: @animation.sid, title: @animation.title, uid: @animation.uid }
    assert_redirected_to animation_path(assigns(:animation))
  end

  test "should destroy animation" do
    assert_difference('Animation.count', -1) do
      delete :destroy, id: @animation
    end

    assert_redirected_to animations_path
  end
end
