# frozen_string_literal: true

class RemoveRoleFromCoworker < ActiveRecord::Migration[6.0]
  def change
    remove_column :coworkers, :role
  end
end
