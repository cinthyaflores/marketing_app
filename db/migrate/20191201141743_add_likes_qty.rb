# frozen_string_literal: true

class AddLikesQty < ActiveRecord::Migration[6.0]
  def change
    add_column :campaigns, :page_likes, :integer
  end
end
