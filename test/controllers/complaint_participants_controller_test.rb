require "test_helper"

class ComplaintParticipantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @complaint_participant = complaint_participants(:one)
  end

  test "should get index" do
    get complaint_participants_url, as: :json
    assert_response :success
  end

  test "should create complaint_participant" do
    assert_difference('ComplaintParticipant.count') do
      post complaint_participants_url, params: { complaint_participant: { first_name: @complaint_participant.first_name } }, as: :json
    end

    assert_response 201
  end

  test "should show complaint_participant" do
    get complaint_participant_url(@complaint_participant), as: :json
    assert_response :success
  end

  test "should update complaint_participant" do
    patch complaint_participant_url(@complaint_participant), params: { complaint_participant: { first_name: @complaint_participant.first_name } }, as: :json
    assert_response 200
  end

  test "should destroy complaint_participant" do
    assert_difference('ComplaintParticipant.count', -1) do
      delete complaint_participant_url(@complaint_participant), as: :json
    end

    assert_response 204
  end
end
