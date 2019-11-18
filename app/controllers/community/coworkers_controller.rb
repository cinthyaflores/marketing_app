# frozen_string_literal: true

module Community
  class CoworkersController < ApplicationController
    def create
      @coworker = Coworker.new(coworker_params)
      if @coworker.save
        flash[:notice] = 'Registrado correctamente'
      else
        flash[:alert] = 'Error registrando'
      end
      redirect_to community_campaign_path(@coworker.campaign)
    end

    private

    def coworker_params
      params.require(:coworker)
            .permit(:role)
            .merge(campaign: Campaign.find(params[:campaign_id]),
                   user: User.find(params[:coworker][:user]))
    end
  end
end
