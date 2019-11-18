# frozen_string_literal: true

class AddAttributesToCampaigns < ActiveRecord::Migration[6.0]
  def change
    add_column :campaigns, :start_date, :date, null: false
    add_column :campaigns, :end_date, :date, null: false
    add_column :campaigns, :objective, :string
    add_column :campaigns, :campaign_type, :integer, null: false
    add_column :campaigns, :product, :string
    add_reference :campaigns, :manager, foreign_key: { to_table: :users }
  end
end
