# frozen_string_literal: true

class ReferenceEdgeToNetwork < ActiveRecord::Migration[6.0]
  def change
    add_reference :edges, :network
    remove_reference :edges, :campaign
  end
end
