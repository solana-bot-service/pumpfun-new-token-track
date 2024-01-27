# frozen_string_literal: true

require 'test_helper'

class ParseWebhookJobTest < ActiveSupport::TestCase
  test "should parse webhook correctly" do
    job = ParseWebhookJob.new
    params = File.read('test/fixtures/files/webhook.json')
    parsed_webhook = job.perform(params)
    assert_not_nil parsed_webhook
    assert_equal '4R8y99utorr5s7X5i2wkULqEVAAybtrypWymccsuLHoK', parsed_webhook.first['accountData'].first['account']
  end

  test "should return token address" do
    job = ParseWebhookJob.new
    params = File.read('test/fixtures/files/webhook.json')
    parsed_webhook = job.perform(params)
    assert_equal '5zqEcbFnjntxS5ygPLPPoDDXNW2j6gjYNmA5zasWDyB5', job.token_address
  end
end