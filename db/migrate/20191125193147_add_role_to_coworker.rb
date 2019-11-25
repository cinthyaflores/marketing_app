class AddRoleToCoworker < ActiveRecord::Migration[6.0]
  def change
    add_column :coworkers, :role, :integer
  end
end
