# frozen_string_literal: true

# == Schema Information
#
# Table name: clients
#
#  id             :bigint           not null, primary key
#  user_id        :bigint
#  corporation_id :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Client < ApplicationRecord
  belongs_to :user
  belongs_to :corporation
end
