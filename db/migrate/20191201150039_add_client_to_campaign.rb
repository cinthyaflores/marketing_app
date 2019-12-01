class AddClientToCampaign < ActiveRecord::Migration[6.0]
  def change
    add_reference :campaigns, :user
  end
end
