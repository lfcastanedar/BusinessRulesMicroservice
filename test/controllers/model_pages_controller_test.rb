require "test_helper"

class ModelPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @model_page = model_pages(:one)
  end

  test "should get index" do
    get model_pages_url, as: :json
    assert_response :success
  end

  test "should create model_page" do
    assert_difference('ModelPage.count') do
      post model_pages_url, params: { model_page: { name: @model_page.name } }, as: :json
    end

    assert_response 201
  end

  test "should show model_page" do
    get model_page_url(@model_page), as: :json
    assert_response :success
  end

  test "should update model_page" do
    patch model_page_url(@model_page), params: { model_page: { name: @model_page.name } }, as: :json
    assert_response 200
  end

  test "should destroy model_page" do
    assert_difference('ModelPage.count', -1) do
      delete model_page_url(@model_page), as: :json
    end

    assert_response 204
  end
end
