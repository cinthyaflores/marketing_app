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
#


class Company < ApplicationRecord
  has_many :employees, class_name: 'User'
  validates :name,
            :legal_representant_name,
            :legal_representant_email,
            :legal_representant_phone,
            :legal_representant_role,
            :bussines_name,
            :rfc,
            :location, presence: true
end
