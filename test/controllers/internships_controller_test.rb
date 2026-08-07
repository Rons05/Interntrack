require "test_helper"

class InternshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get internships_index_url
    assert_response :success
  end

  test "should get new" do
    get internships_new_url
    assert_response :success
  end

  test "should get create" do
    get internships_create_url
    assert_response :success
  end

  test "should get show" do
    get internships_show_url
    assert_response :success
  end

  test "should get edit" do
    get internships_edit_url
    assert_response :success
  end

  test "should get update" do
    get internships_update_url
    assert_response :success
  end

  test "should get destroy" do
    get internships_destroy_url
    assert_response :success
  end
end
