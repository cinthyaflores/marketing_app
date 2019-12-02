# frozen_string_literal: true

class LandingPageController < ApplicationController
  def index
    campaigns if current_user&.designer? || current_user&.content_creator?

    @corporations = Corporation.all
    @companies = Company.all
    if !current_user || current_user.owner?
      render layout: 'landing_page'
    else
      render layout: 'application'
    end
  end

  private

  def campaigns
    coworkers = Coworker.where(user_id: current_user.id)
    tasks = []
    posts = []
    nodes = []
    networks = []
    @campaigns = []

    coworkers.each do |cw|
      tasks << cw.tasks
    end

    tasks.flatten.each do |t|
      posts << t.post
    end

    posts.flatten.each do |post|
      nodes << post.node
    end

    nodes.flatten.each do |node|
      networks << node.network
    end

    networks.flatten.each do |network|
      @campaigns << network.campaign
    end

    @campaigns.uniq!
  end
end
