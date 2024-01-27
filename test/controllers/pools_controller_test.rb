require "test_helper"

class PoolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pool = pools(:one)
  end

  test "should get index" do
    get pools_url, as: :json
    assert_response :success
  end

  test "should create pool" do
    assert_difference("Pool.count") do
      post pools_url, params: { pool: { address: @pool.address, liquidity: @pool.liquidity, name: @pool.name, protocol_id: @pool.protocol_id } }, as: :json
    end

    assert_response :created
  end

  test "should show pool" do
    get pool_url(@pool), as: :json
    assert_response :success
  end

  test "should update pool" do
    patch pool_url(@pool), params: { pool: { address: @pool.address, liquidity: @pool.liquidity, name: @pool.name, protocol_id: @pool.protocol_id } }, as: :json
    assert_response :success
  end

  test "should destroy pool" do
    assert_difference("Pool.count", -1) do
      delete pool_url(@pool), as: :json
    end

    assert_response :no_content
  end
end
