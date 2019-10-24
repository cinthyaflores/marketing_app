# frozen_string_literal: true

# == Schema Information
#
# Table name: corporations
#
#  id                       :bigint           not null, primary key
#  name                     :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  legal_representant_name  :string           not null
#  legal_representant_email :string           not null
#  legal_representant_phone :string           not null
#  legal_representant_role  :string           not null
#

class Corporation < ApplicationRecord
  has_and_belongs_to_many :clients
  has_and_belongs_to_many :contacts

  has_many :campains
  has_many :companies

  validates :name,
            :legal_representant_name,
            :legal_representant_email,
            :legal_representant_phone,
            :legal_representant_role, presence: true
  validates :name, length: { in: 5..30 }
  validates :legal_representant_role, length: { in: 3..20 }
  validates :legal_representant_phone, length: { in: 10..12 }
  validates :legal_representant_name,
            :legal_representant_email, length: { in: 10..40 }
end
