# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :employees, class_name: 'User'
  has_many :campains, as: :company

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
  validates :rfc, length: { in: 16..17 }
  validates :location, length: { in: 20..40 }
  validates :name, length: { in: 5..20 }
end
