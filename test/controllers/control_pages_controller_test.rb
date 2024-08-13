require "test_helper"

class ControlPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @control_page = control_pages(:one)
  end

  test "should get index" do
    get control_pages_url, as: :json
    assert_response :success
  end

  test "should create control_page" do
    assert_difference('ControlPage.count') do
      post control_pages_url, params: { control_page: { name: @control_page.name } }, as: :json
    end

    assert_response 201
  end

  test "should show control_page" do
    get control_page_url(@control_page), as: :json
    assert_response :success
  end

  test "should update control_page" do
    patch control_page_url(@control_page), params: { control_page: { name: @control_page.name } }, as: :json
    assert_response 200
  end

  test "should destroy control_page" do
    assert_difference('ControlPage.count', -1) do
      delete control_page_url(@control_page), as: :json
    end

    assert_response 204
  end
end
