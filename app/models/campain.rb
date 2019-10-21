# frozen_string_literal: true

# == Schema Information
#
# Table name: campains
#
#  id           :bigint           not null, primary key
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  start_date   :date             not null
#  end_date     :date             not null
#  objective    :string
#  campain_type :integer          not null
#  product      :string
#  manager_id   :bigint
#


class Campain < ApplicationRecord
  belongs_to :manager, class_name: 'User', foreign_key: 'manager_id'
  has_many :coworkers
  validates :name,
            :start_date,
            :end_date,
            :objective,
            :campain_type,
            :product, presence: true
end
