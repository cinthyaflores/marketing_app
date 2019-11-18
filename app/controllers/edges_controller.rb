# frozen_string_literal: true

class EdgesController < ApplicationController
  def new
    @campaign = Campaign.find(params[:campaign_id])
    @edge = @campaign.edges.new
  end

  def edit
    @campaign = Campaign.find(params[:campaign_id])
    @edge = Edge.find(params[:id])
  end

  def index
    @campaign = Campaign.find(params[:campaign_id])
    @edges = @campaign.edges
  end

  def create
    edge = Edge.create(edge_params)
    if edge.persisted?
      flash[:notice] = 'Relación registrada correctamente'
      redirect_to campaign_path(edge.campaign)
    else
      errors = edge.errors.full_messages.join(',')
      flash[:error] = "Error registrando la relación: #{errors}"
      render :new
    end
  end

  def update
    edge = Edge.find(params[:id])
    if edge.update(edge_params)
      flash[:notice] = 'Relación actualizada correctamente'
      redirect_to campaign_edges_path(edge.campaign)
    else
      errors = edge.errors.full_messages.join(',')
      flash[:error] = "Error actualizando la relación: #{errors}"
      render :edit
    end
  end

  def destroy
    edge = Edge.find(params[:id])
    if edge.destroy
      flash[:notice] = 'Nodo eliminado correctamente'
      redirect_to campaign_edges_path(edge.campaign)
    else
      errors = edge.errors.full_messages.join(',')
      flash[:error] = "Error eliminando el nodo: #{errors}"
      render :new
    end
  end

  private

  def edge_params
    params.require(:edge).permit(:from_id, :to_id, :campaign_id)
  end
end
