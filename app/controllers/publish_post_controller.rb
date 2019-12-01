# frozen_string_literal: true

class PublishPostController < ApplicationController
  def update
    @post = Post.find(params[:id])
    campaign = Campaign.find(@post.node.campaign_id)

    @post.published! if FacebookManager.publish(@post.body, @post.content, campaign.token, @post.id)

    redirect_to campaign_posts_path(campaign)
  end
end
