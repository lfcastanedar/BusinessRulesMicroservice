require "test_helper"

class FamilyCommissariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @family_commissary = family_commissaries(:one)
  end

  test "should get index" do
    get family_commissaries_url, as: :json
    assert_response :success
  end

  test "should create family_commissary" do
    assert_difference('FamilyCommissary.count') do
      post family_commissaries_url, params: { family_commissary: { name: @family_commissary.name } }, as: :json
    end

    assert_response 201
  end

  test "should show family_commissary" do
    get family_commissary_url(@family_commissary), as: :json
    assert_response :success
  end

  test "should update family_commissary" do
    patch family_commissary_url(@family_commissary), params: { family_commissary: { name: @family_commissary.name } }, as: :json
    assert_response 200
  end

  test "should destroy family_commissary" do
    assert_difference('FamilyCommissary.count', -1) do
      delete family_commissary_url(@family_commissary), as: :json
    end

    assert_response 204
  end
end
