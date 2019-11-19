# frozen_string_literal: true

# == Schema Information
#
# Table name: nodes
#
#  id         :bigint           not null, primary key
#  label      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  color      :string
#  network_id :bigint
#

class Node < ApplicationRecord
  has_many :edges, foreign_key: 'from_id', dependent: :destroy
  has_one :post
  belongs_to :network

  validates :label, presence: true

  delegate :campaign_id, to: :network

  before_save :define_node_color

  private

  def define_node_color
    self.color = '#34dbeb'
  end
end
