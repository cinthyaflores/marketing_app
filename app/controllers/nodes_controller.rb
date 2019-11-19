# frozen_string_literal: true

class NodesController < ApplicationController
  before_action :assign_network

  def new
    @node = @network.nodes.new
  end

  def edit
    @node = Node.find(params[:id])
  end

  def index
    @nodes = @network.nodes
  end

  def create
    node = Node.create(node_params)
    if node.persisted?
      flash[:notice] = 'Nodo registrado correctamente'
      redirect_to network_path(id: node.network.id)
    else
      errors = node.errors.full_messages.join(',')
      flash[:error] = "Error registrando el nodo: #{errors}"
      render :new
    end
  end

  def update
    node = Node.find(params[:id])
    if node.update(node_params)
      flash[:notice] = 'Nodo actualizado correctamente'
      redirect_to network_nodes_path(node.network)
    else
      errors = node.errors.full_messages.join(',')
      flash[:error] = "Error actualizando el nodo: #{errors}"
      render :new
    end
  end

  def destroy
    node = Node.find(params[:id])
    if node.destroy
      flash[:notice] = 'Nodo eliminado correctamente'
      redirect_to network_nodes_path(node.network)
    else
      errors = node.errors.full_messages.join(',')
      flash[:error] = "Error eliminando el nodo: #{errors}"
      render :new
    end
  end

  private

  def node_params
    params.require(:node).permit(:label, :network_id)
  end

  def assign_network
    @network = Network.find(params[:network_id])
  end
end
