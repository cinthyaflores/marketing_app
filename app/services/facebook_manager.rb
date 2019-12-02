# frozen_string_literal: true

require 'koala'

class FacebookManager
  def self.app_connection
    Koala::Facebook::OAuth.new(ENV['FB_ID'], ENV['FB_SECRET'])
  end

  def self.connection(token_id)
    app_connection
    Koala::Facebook::API.new(token_id)
  end

  def self.publish(message, visual, token_id, post_id)
    response = if visual.present?
                 if Rails.env.development?
                   image = ActiveStorage::Blob.service.path_for(visual.key)
                 end
                 image = visual.service_url if Rails.env.production?
                 connection(token_id).put_picture(image, visual.content_type, message: message)
               else
                 connection(token_id).put_connections('me', 'feed', message: message)
               end

    Post.find(post_id).update(fb_id: response['id'])
  end

  def self.publish_post(post)
    PostPublisherJob.set(wait_until: post.publish_date).perform_later(post)
  end

  def self.get_post_reactions(fb_id, token_id)
    connection(token_id).get_object(fb_id, fields: 'reactions.summary(true)')['reactions']['data']
  rescue StandardError => e
    'error'
  end

  def self.get_post_comments(fb_id, token_id)
    connection(token_id).get_object(fb_id, fields: 'comments')['comments']['data']
  rescue StandardError => e
    'error'
  end
end
