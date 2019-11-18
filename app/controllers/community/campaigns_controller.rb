# frozen_string_literal: true

module Community
  class CampaignsController < ApplicationController
    def index
      @campaigns = current_user.campaigns
    end

    def show
      respond_to do |format|
        format.html do
          build_html
        end
        format.json do
          build_json
        end
      end
    end

    private

    def build_html
      @campaign = current_user.campaigns.find(params[:id])
      @coworker = @campaign.coworkers.build
    end

    def build_json
      @campaign = current_user.campaigns.find(params[:id])
      render json: { nodes: @campaign.nodes, edges: @campaign.edges }
    end
  end
end
