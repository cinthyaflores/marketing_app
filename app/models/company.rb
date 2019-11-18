# frozen_string_literal: true

# == Schema Information
#
# Table name: companies
#
#  id                       :bigint           not null, primary key
#  name                     :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  legal_representant_name  :string           not null
#  legal_representant_email :string           not null
#  legal_representant_phone :string           not null
#  legal_representant_role  :string           not null
#  bussines_name            :string           not null
#  rfc                      :string           not null
#  location                 :string           not null
#  corporation_id           :integer
#

class Company < ApplicationRecord
  has_many :employees, class_name: 'User'
  has_many :campaigns

  belongs_to :corporation, optional: true

  validates :name,
            :legal_representant_name,
            :legal_representant_email,
            :legal_representant_phone,
            :legal_representant_role,
            :bussines_name,
            :rfc,
            :location, presence: true

  validates :bussines_name,
            :legal_representant_name,
            :legal_representant_email, length: { in: 10..40 }

  validates :legal_representant_role, length: { in: 3..20 }
  validates :legal_representant_phone, length: { in: 10..12 }
  validates :rfc, length: { in: 12..17 }
  validates :location, length: { in: 20..40 }
  validates :name, length: { in: 5..20 }
end
