require 'test_helper'

class FreeEbooksControllerTest < ActionController::TestCase
  setup do
    @free_ebook = free_ebooks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:free_ebooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create free_ebook" do
    assert_difference('FreeEbook.count') do
      post :create, free_ebook: { description: @free_ebook.description, status: @free_ebook.status, title: @free_ebook.title, user_id: @free_ebook.user_id }
    end

    assert_redirected_to free_ebook_path(assigns(:free_ebook))
  end

  test "should show free_ebook" do
    get :show, id: @free_ebook
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @free_ebook
    assert_response :success
  end

  test "should update free_ebook" do
    patch :update, id: @free_ebook, free_ebook: { description: @free_ebook.description, status: @free_ebook.status, title: @free_ebook.title, user_id: @free_ebook.user_id }
    assert_redirected_to free_ebook_path(assigns(:free_ebook))
  end

  test "should destroy free_ebook" do
    assert_difference('FreeEbook.count', -1) do
      delete :destroy, id: @free_ebook
    end

    assert_redirected_to free_ebooks_path
  end
end
