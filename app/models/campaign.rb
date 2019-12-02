# frozen_string_literal: true

# == Schema Information
#
# Table name: campaigns
#
#  id                 :bigint           not null, primary key
#  name               :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  start_date         :date             not null
#  end_date           :date             not null
#  objective          :string
#  campaign_type      :string           not null
#  product            :string
#  manager_id         :bigint
#  company_id         :integer
#  company_type       :string
#  token              :string
#  encrypted_token    :string
#  encrypted_token_iv :string
#  page_likes         :integer
#  user_id            :bigint
#

class Campaign < ApplicationRecord
  # attr_encrypted :token, key: Rails.application.credentials.token[:key]

  belongs_to :manager, class_name: 'User', foreign_key: 'manager_id'

  has_many :coworkers, dependent: :destroy
  has_one :network, dependent: :destroy
  has_many :nodes, through: :network, dependent: :destroy
  has_many :edges, through: :network, dependent: :destroy
  has_many :posts, through: :nodes, dependent: :destroy
  has_many :tasks, through: :posts, dependent: :destroy
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

  after_create :create_network

  def create_network
    Network.create(campaign_id: id)
  end

  def external?
    company_id != 1
  end
end
