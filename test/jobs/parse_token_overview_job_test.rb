# frozen_string_literal: true

require 'test_helper'

class ParseTokenOverviewJobTest < ActiveSupport::TestCase
  test "should parse webhook correctly" do
    job = ParseTokenOverviewJob.new
    params = File.read('test/fixtures/files/token.json')
    parsed_token_params = job.perform(params)
    assert_not_nil parsed_token_params

    expected = {
      name: "Wrapped SOL",
      address: "So11111111111111111111111111111111111111112",
      symbol: "SOL",
      liquidity: 286160837.0927743,
      price: 100.73038300653013,
      supply: 566386746.204681,
      market_cap: 57174534640.46407,
      watchers: 1430,
      logo_url: "https://img.fotofolio.xyz/?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsolana-labs%2Ftoken-list%2Fmain%2Fassets%2Fmainnet%2FSo11111111111111111111111111111111111111112%2Flogo.png"
    }

    assert_equal expected, parsed_token_params
  end
end