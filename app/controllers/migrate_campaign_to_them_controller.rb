# frozen_string_literal: true

class MigrateCampaignToThemController < ApplicationController
  def update
    @campaign = Campaign.find(params[:id])
    if update_campaign
      redirect_to campaign_path(@campaign), notice: 'La campaña fue exitosamente migrada.'
    else
      flash[:error] = 'La campaña no se pudo migrar.'
      redirect_to campaign_path(@campaign)
    end
  end

  private

  def update_campaign
    company_id = params[:campaign][:company_id]
    @campaign.update(company_id: company_id, manager_id: User.community_managers(company_id).first.id) &&
      Coworker.where(campaign_id: @campaign.id).destroy_all
  end
end
