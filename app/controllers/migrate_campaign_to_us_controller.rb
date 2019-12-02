# frozen_string_literal: true

class MigrateCampaignToUsController < ApplicationController
  def update
    @campaign = Campaign.find(params[:id])
    if update_campaign
      redirect_to campaign_path(@campaign), notice: 'La campaña fue exitosamente migrada.'
    else
      redirect_to campaign_path(@campaign), error: 'La campaña no se pudo migrar.'
    end
  end

  private

  def update_campaign
    @campaign.update(company_id: 1, manager_id: User.community_managers(1).first.id) &&
      Coworker.where(campaign_id: @campaign.id).destroy_all
  end
end
