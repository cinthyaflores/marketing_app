# frozen_string_literal: true

class AddFbPostIdToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :fb_id, :string
  end
end
