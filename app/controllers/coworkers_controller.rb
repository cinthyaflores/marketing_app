# frozen_string_literal: true

class CoworkersController < ApplicationController
  before_action :assign_campaign
  before_action :sanitize_params, only: %i[create update]

  def new
    @coworker = @campaign.coworkers.new
  end

  def index
    @coworkers = @campaign.coworkers
  end

  def create
    @coworker = Coworker.new(coworker_params)
    if @coworker.save
      flash[:notice] = 'Registrado correctamente'
    else
      flash[:alert] = 'Error registrando'
    end
    redirect_to campaign_coworkers_path(@campaign)
  end

  def destroy
    @coworker = Coworker.find(params[:id])
    if @coworker.destroy
      flash[:notice] = 'Eliminado correctamente'
    else
      flash[:alert] = 'Error elimnando'
    end
    redirect_to campaign_coworkers_path(@campaign)
  end

  private

  def coworker_params
    params.require(:coworker).permit(:campaign_id, :user_id, :role)
  end

  def sanitize_params
    params[:coworker][:role] = params[:coworker][:role].to_i
  end

  def assign_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end
end
