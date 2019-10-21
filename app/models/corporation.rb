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
  has_many :clients, class_name: 'User'
  has_many :contacts, class_name: 'User'

  validates :name,
            :legal_representant_name,
            :legal_representant_email,
            :legal_representant_phone,
            :legal_representant_role, presence: true
end
