# frozen_string_literal: true

class AddCompanyToCampaign < ActiveRecord::Migration[6.0]
  def change
    add_column :campaigns, :company_id, :integer
    add_column :campaigns, :company_type, :string
  end
end
