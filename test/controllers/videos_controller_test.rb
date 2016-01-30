require 'test_helper'

class VideosControllerTest < ActionController::TestCase
  setup do
    @video = videos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:videos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create video" do
    assert_difference('Video.count') do
      post :create, video: { category_title: @video.category_title, category_title: @video.category_title, dislike_count: @video.dislike_count, duration: @video.duration, like_count: @video.like_count, link: @video.link, published_at: @video.published_at, thumbnail_url: @video.thumbnail_url, title: @video.title, uid: @video.uid }
    end

    assert_redirected_to video_path(assigns(:video))
  end

  test "should show video" do
    get :show, id: @video
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @video
    assert_response :success
  end

  test "should update video" do
    patch :update, id: @video, video: { category_title: @video.category_title, category_title: @video.category_title, dislike_count: @video.dislike_count, duration: @video.duration, like_count: @video.like_count, link: @video.link, published_at: @video.published_at, thumbnail_url: @video.thumbnail_url, title: @video.title, uid: @video.uid }
    assert_redirected_to video_path(assigns(:video))
  end

  test "should destroy video" do
    assert_difference('Video.count', -1) do
      delete :destroy, id: @video
    end

    assert_redirected_to videos_path
  end
end
