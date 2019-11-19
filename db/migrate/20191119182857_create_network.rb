# frozen_string_literal: true

class CreateNetwork < ActiveRecord::Migration[6.0]
  def change
    create_table :networks do |t|
      t.references :campaign, null: false
    end
  end
end
