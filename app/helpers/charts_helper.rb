# frozen_string_literal: true

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
end
