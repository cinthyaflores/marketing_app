# frozen_string_literal: true

require 'koala'

class FacebookManager
  def self.app_connection
    Koala::Facebook::OAuth.new(Rails.application.credentials.fb[:id], Rails.application.credentials.fb[:secret])
  end

  def self.connection(token_id)
    app_connection
    Koala::Facebook::API.new(token_id)
  end

  def self.publish(message, _visual, token_id)
    connection(token_id).put_connections('me', 'feed', message: message)
  end

  def self.publish_post(post)
    binding.pry

    PostPublisherJob.set(wait_until: post.publish_date).perform_later(post)
  end
end
