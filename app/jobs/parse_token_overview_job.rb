# frozen_string_literal: true

class ParseTokenOverviewJob < ApplicationJob
  attr_reader :params

  def perform(params)
    @params = params

    token_params
  end

  def token_params
    @token_params ||= parsed_token_overview['data'].then do |token_params|
      {
        name: token_params['name'],
        address: token_params['address'],
        symbol: token_params['symbol'],
        liquidity: token_params['liquidity'],
        price: token_params['price'],
        supply: token_params['supply'],
        market_cap: token_params['mc'],
        watchers: token_params['watch'],
        logo_url: token_params['logoURI']
      }
    end
  end

  private

  def parsed_token_overview
    @parsed_token_overview ||= JSON.parse(params)
  end
end
