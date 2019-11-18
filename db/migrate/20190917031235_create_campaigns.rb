# frozen_string_literal: true

class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
