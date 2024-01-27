# frozen_string_literal: true

class SendDiscordWebhookJob < ApplicationJob
  def perform(token)
    client.execute do |builder|
      builder.content = "New Solana token detected: **#{token.name}**"

      builder.add_embed do |embed|
        embed.url = "https://birdeye.so/token/#{token.address}"
        embed.color = 10764191
        embed.description = token.name
        embed.timestamp = Time.current
        embed.footer = { icon_url: token.logo_url }
        embed.thumbnail = { url: token.logo_url }
        embed.image = { url: token.logo_url }
        embed.author = { name: token.name, url: "https://birdeye.so/token/#{token.address}", icon_url: token.logo_url }
        embed.fields = [
          { name: 'Ticker', value: "$#{token.symbol}" },
          { name: 'Market Cap', value: "$#{token.market_cap}" },
          { name: 'Price', value: "$#{token.price}" },
          { name: 'Liquidity', value: "$#{token.liquidity}" },
          { name: 'Supply', value: token.supply },
          { name: 'Watchers', value: token.watchers },
          { name: 'Address', value: token.address }
        ]
      end
    end
  end

  private

  def discord_client
    @discord_client ||= Discordrb::Webhooks::Client.new(url: Rails.application.credentials.dig(:discord, :webhook_url))
  end
end