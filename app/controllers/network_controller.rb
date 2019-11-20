# frozen_string_literal: true

class NetworkController < ApplicationController
  def show
    @campaign = Campaign.find(params[:id])
    network
    build_nodes
    build_edges
  end

  private

  def build_nodes
    @nodes = ''
    @campaign.nodes.map do |node|
      @nodes += "{\"id\": #{node.id}, \"label\": \"#{node.label}\"}|"
    end
  end

  def build_edges
    @edges = ''
    @campaign.edges.map do |edge|
      @edges += "{ \"from\": #{edge.from_id}, \"to\": #{edge.to_id}}|"
    end
  end

  def network
    @network ||= @campaign.network
  end
end
