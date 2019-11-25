class DefaultDate < ActiveRecord::Migration[6.0]
  def change
    change_column :tasks, :deadline, :datetime, default: Time.zone.now
  end
end
