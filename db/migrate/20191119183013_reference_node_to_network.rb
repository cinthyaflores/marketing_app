# frozen_string_literal: true

class ReferenceNodeToNetwork < ActiveRecord::Migration[6.0]
  def change
    add_reference :nodes, :network
    remove_reference :nodes, :campaign
  end
end
