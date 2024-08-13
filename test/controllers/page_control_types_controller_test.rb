require "test_helper"

class PageControlTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page_control_type = page_control_types(:one)
  end

  test "should get index" do
    get page_control_types_url, as: :json
    assert_response :success
  end

  test "should create page_control_type" do
    assert_difference('PageControlType.count') do
      post page_control_types_url, params: { page_control_type: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show page_control_type" do
    get page_control_type_url(@page_control_type), as: :json
    assert_response :success
  end

  test "should update page_control_type" do
    patch page_control_type_url(@page_control_type), params: { page_control_type: {  } }, as: :json
    assert_response 200
  end

  test "should destroy page_control_type" do
    assert_difference('PageControlType.count', -1) do
      delete page_control_type_url(@page_control_type), as: :json
    end

    assert_response 204
  end
end
