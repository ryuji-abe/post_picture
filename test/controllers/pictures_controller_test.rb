require 'test_helper'

class PicturesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pictures_new_url
    assert_response :success
  end

  test "should get create" do
    get pictures_create_url
    assert_response :success
  end

  test "should get confirm" do
    get pictures_confirm_url
    assert_response :success
  end

  test "should get edit" do
    get pictures_edit_url
    assert_response :success
  end

  test "should get update" do
    get pictures_update_url
    assert_response :success
  end

  test "should get index" do
    get pictures_index_url
    assert_response :success
  end

  test "should get destroy" do
    get pictures_destroy_url
    assert_response :success
  end

end
