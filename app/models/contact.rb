# frozen_string_literal: true

# == Schema Information
#
# Table name: contacts
#
#  id             :bigint           not null, primary key
#  user_id        :bigint
#  corporation_id :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :corporation
end
