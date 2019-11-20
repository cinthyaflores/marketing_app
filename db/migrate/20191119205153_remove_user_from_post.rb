# frozen_string_literal: true

class RemoveUserFromPost < ActiveRecord::Migration[6.0]
  def change
    remove_reference :posts, :user
  end
end
