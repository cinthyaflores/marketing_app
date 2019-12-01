# frozen_string_literal: true

class AddTokenToCampaign < ActiveRecord::Migration[6.0]
  def change
    add_column :campaigns, :token, :string
    add_column :campaigns, :encrypted_token, :string
    add_column :campaigns, :encrypted_token_iv, :string

    add_index :campaigns, :encrypted_token_iv, unique: true
  end
end
