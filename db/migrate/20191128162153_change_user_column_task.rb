# frozen_string_literal: true

class ChangeUserColumnTask < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :user_id
    add_reference :tasks, :coworker, foreign_key: true
  end
end
