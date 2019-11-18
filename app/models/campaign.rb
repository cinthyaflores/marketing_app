# frozen_string_literal: true

# == Schema Information
#
# Table name: campaigns
#
#  id           :bigint           not null, primary key
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  start_date   :date             not null
#  end_date     :date             not null
#  objective    :string
#  campaign_type :string           not null
#  product      :string
#  manager_id   :bigint
#  company_id   :integer
#  company_type :string
#

class Campaign < ApplicationRecord
  belongs_to :manager, class_name: 'User', foreign_key: 'manager_id'
  has_many :coworkers
  has_many :nodes
  has_many :edges, through: :nodes
  has_one_attached :image
  belongs_to :company

  validates :name,
            :start_date,
            :end_date,
            :objective,
            :campaign_type,
            :product,
            :image,
            presence: true

  validates :name, :objective, :product, length: { in: 5..30 }
end
