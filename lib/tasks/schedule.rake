task :publish_facebook => :environment do
  start_date = Time.now - 5.minutes
  end_date = Time.now + 5.minutes
  posts = Post.where(fb_id: nil, publish_date: start_date..end_date)
  posts.each do |post|
    campaign = Campaign.find(post.node.campaign_id)
    campaign.token ? token = campaign.token : token = nil
    if FacebookManager.publish(post.body, post.content, token, post.id)
      post.published!
    end 
  end
end
