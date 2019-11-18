# frozen_string_literal: true

class AddCampaignToEdge < ActiveRecord::Migration[6.0]
  def change
    add_reference :edges, :campaign
  end
end
