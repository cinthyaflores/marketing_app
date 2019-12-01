# frozen_string_literal: true

require 'indico'

module ChartsHelper
  def posts_statistics(campaign)
    reactions_summary = {}
    reactions = []
    campaign.posts.each do |post|
      reactions << FacebookManager.get_post_reactions(post.fb_id, campaign.token)
    end
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
    analize_comments(posts_comments(campaign))
  end

  def analize_comments(comments)
    Indico.api_key = Rails.application.credentials.indico_key
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
      comments << FacebookManager.get_post_comments(post.fb_id, campaign.token)
    end

    comments.flatten.map! do |comment|
      next nil if comment.eql?('error')

      comment['message']
    end.compact!
  end
end
