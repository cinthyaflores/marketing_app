# frozen_string_literal: true

class Corporation < ApplicationRecord
  has_and_belongs_to_many :clients
  has_and_belongs_to_many :contacts
  has_many :campainns, as: :company

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
