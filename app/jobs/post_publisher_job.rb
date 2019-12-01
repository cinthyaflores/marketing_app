# frozen_string_literal: true

class PostPublisherJob < ApplicationJob
  queue_as :posts

  def perform(post)
    unless post.status.published?
      campaign = Campaign.find(post.node.campaign_id)
      FacebookManager.publish(post.body, post.content, campaign.token, post.id)
    end
  end
end
