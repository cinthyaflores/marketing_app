class RelateCompanyWithCorporation < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :corporation_id, :integer, foreign_key: true
  end
end
