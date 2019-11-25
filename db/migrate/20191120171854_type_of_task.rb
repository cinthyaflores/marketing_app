# frozen_string_literal: true

class TypeOfTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :category, :integer, default: 0
  end
end
