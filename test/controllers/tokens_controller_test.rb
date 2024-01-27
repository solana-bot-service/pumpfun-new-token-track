require "test_helper"

class TokensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @token = tokens(:one)
  end

  test "should get index" do
    get tokens_url, as: :json
    assert_response :success
  end

  test "should create token" do
    assert_difference("Token.count") do
      post tokens_url, params: { token: { address: @token.address, market_cap: @token.market_cap, pool_id: @token.pool_id, ticker: @token.ticker } }, as: :json
    end

    assert_response :created
  end

  test "should show token" do
    get token_url(@token), as: :json
    assert_response :success
  end

  test "should update token" do
    patch token_url(@token), params: { token: { address: @token.address, market_cap: @token.market_cap, pool_id: @token.pool_id, ticker: @token.ticker } }, as: :json
    assert_response :success
  end

  test "should destroy token" do
    assert_difference("Token.count", -1) do
      delete token_url(@token), as: :json
    end

    assert_response :no_content
  end
end
