# frozen_string_literal: true

class ParseWebhookJob < ApplicationJob
  attr_reader :params

  def perform(params)
    @params = params

    parsed_webhook
  end

  # TODO: maybe get all mint addresses
  def token_address
    @token_address ||= parsed_webhook
      .flat_map { |webhook| webhook['accountData'] }
      .filter_map { |account_data| account_data.dig('tokenBalanceChanges', 0, 'mint') }
      .first
  end

  private

  def parsed_webhook
    @parsed_webhook ||= JSON.parse(params)
  end
end
