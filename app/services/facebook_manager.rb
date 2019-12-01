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

  def self.publish(message, _visual, token_id, post_id)
    response = connection(token_id).put_connections('me', 'feed', message: message)
    Post.find(post_id).update(fb_id: response['id'])
  end

  def self.publish_post(post)
    PostPublisherJob.set(wait_until: post.publish_date).perform_later(post)
  end

  def self.get_post_reactions(fb_id, token_id)
    connection(token_id).get_object(fb_id, fields: 'reactions.summary(true)')['reactions']['data']
  rescue StandardError => e
    p 'error'
  end
end
