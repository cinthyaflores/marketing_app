# frozen_string_literal: true

class CampaignsController < ApplicationController
  before_action :assign_campaign, except: %i[new create index]
  def new
    @campaign = Campaign.new
  end

  def index
    @campaigns = if current_user.client?
                   Campaign.where(user_id: current_user.id)
                 elsif current_user.community_manager?
                   current_user.campaigns
                 else
                   Campaign.all
                 end
  end

  def create
    campaign = Campaign.create(campaign_params)
    if campaign.persisted?
      flash[:notice] = 'La campaña fue registrada correctamente'
    else
      errors = campaign.errors.full_messages.join(',')
      flash[:error] = "Error registrando la campaña: #{errors}"
    end
    redirect_to campaigns_path
  end

  def update
    if @campaign.update(campaign_params)
      flash[:notice] = 'La campaña fue registrada correctamente'
    else
      errors = @campaign.errors.full_messages.join(',')
      flash[:error] = "Error registrando la campaña: #{errors}"
    end
    redirect_to campaigns_path
  end

  private

  def assign_campaign
    @campaign = Campaign.find(params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:name,
                                     :manager_id,
                                     :product,
                                     :company_id,
                                     :objective,
                                     :campaign_type,
                                     :start_date,
                                     :end_date,
                                     :image,
                                     :token,
                                     :user_id)
  end
end
