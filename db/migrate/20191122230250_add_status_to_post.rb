# frozen_string_literal: true

class AddStatusToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :status, :integer, default: 0
  end
end
