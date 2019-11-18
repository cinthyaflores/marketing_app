# frozen_string_literal: true

class CampaignsController < ApplicationController
  def new
    @campaign = Campaign.new
  end

  def show
    @campaign = Campaign.find(params[:id])
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

  def index
    @campaigns = Campaign.all
  end

  private

  def campaign_params
    params.require(:campaign).permit(:name,
                                     :manager_id,
                                     :product,
                                     :company_id,
                                     :objective,
                                     :campaign_type,
                                     :start_date,
                                     :end_date,
                                     :image)
  end
end
