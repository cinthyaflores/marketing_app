# frozen_string_literal: true

require 'indico'

module ChartsHelper
  def posts_statistics(campaign)
    reactions = []
    campaign.posts.each do |post|
      reactions << FacebookManager.get_post_reactions(post.fb_id, campaign.token)
    end
    process_reactions(reactions)
  end

  def post_statistics(post)
    token = Campaign.find(post.node.network.campaign_id).token
    reactions = FacebookManager.get_post_reactions(post.fb_id, token)
    process_reactions(reactions)
  end

  def process_reactions(reactions)
    reactions_summary = {}

    return if reactions.eql?('error')

    reactions.flatten.each do |reaction|
      next if reaction.eql?('error')

      if reactions_summary[reaction['type']].nil?
        reactions_summary[reaction['type']] = 1
      else
        reactions_summary[reaction['type']] += 1
      end
    end

    reactions_summary
  end

  def posts_comments_statistics(campaign)
    Indico.api_key = ENV['INDICO_KEY']

    analize_comments(posts_comments(campaign))
  end

  def post_comments_statistics(post)
    Indico.api_key = ENV['INDICO_KEY']

    analize_comments(post_comments(post))
  end

  def analize_comments(comments)
    positive_comments = 0
    negative_comments = 0

    comments&.each do |message|
      sentiment = Indico.sentiment(message)
      sentiment > 0.5 ? positive_comments += 1 : negative_comments += 1
    rescue StandardError => e
      ''
    end


    { 'Comentarios positivos': positive_comments,
      'Comentarios negativos': negative_comments }
  end

  def posts_comments(campaign)
    comments = []
    campaign.posts.each do |post|
      comments << post_comments(post)
    end

    comments.flatten!&.compact!

    return if comments.eql?('error')

    comments.map! do |comment|
      next nil if comment.eql?('error') || comment.nil?

      comment['message']
    end.compact!

    comments
  end

  def post_comments(post)
    token = Campaign.find(post.node.network.campaign_id).token
    comments = FacebookManager.get_post_comments(post.fb_id, token)

    return if comments.eql?('error')

    comments.map! do |comment|
      next nil if comment.eql?('error')

      comment['message']
    end.compact!
    comments
  end
end
