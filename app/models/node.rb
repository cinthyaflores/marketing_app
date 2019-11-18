# frozen_string_literal: true

# == Schema Information
#
# Table name: nodes
#
#  id         :bigint           not null, primary key
#  campaign_id :bigint           not null
#  label      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  color      :string
#

class Node < ApplicationRecord
  has_many :edges, foreign_key: 'from_id', dependent: :destroy
  validates :label, presence: true
  before_save :define_node_color
  has_one :post

  private

  def define_node_color
    self.color = '#34dbeb'
  end
end
