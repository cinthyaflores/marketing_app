# frozen_string_literal: true

class TaskCoworkersController < ApplicationController
  def show
    campaign = Campaign.find(params[:campaign_id])
    @coworkers = campaign.coworkers.designer if params[:user_type_id] == '1'
    @coworkers = campaign.coworkers.content_generator if params[:user_type_id] == '0'
  end
end
