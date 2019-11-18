# frozen_string_literal: true

class ChangeCampaignTypeAttribute < ActiveRecord::Migration[6.0]
  def up
    change_column :campaigns, :campaign_type, :string
  end
end
