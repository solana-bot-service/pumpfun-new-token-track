require "test_helper"

class ProtocolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @protocol = protocols(:one)
  end

  test "should get index" do
    get protocols_url, as: :json
    assert_response :success
  end

  test "should create protocol" do
    assert_difference("Protocol.count") do
      post protocols_url, params: { protocol: { name: @protocol.name } }, as: :json
    end

    assert_response :created
  end

  test "should show protocol" do
    get protocol_url(@protocol), as: :json
    assert_response :success
  end

  test "should update protocol" do
    patch protocol_url(@protocol), params: { protocol: { name: @protocol.name } }, as: :json
    assert_response :success
  end

  test "should destroy protocol" do
    assert_difference("Protocol.count", -1) do
      delete protocol_url(@protocol), as: :json
    end

    assert_response :no_content
  end
end
