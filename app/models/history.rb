# frozen_string_literal: true

# == Schema Information
#
# Table name: histories
#
#  id         :bigint           not null, primary key
#  content    :string           not null
#  user       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'csv'

class History < ApplicationRecord
  def self.to_csv
    attributes = %w[id content user]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |row|
        csv << attributes.map { |attr| row.send(attr) }
      end
    end
  end
end
