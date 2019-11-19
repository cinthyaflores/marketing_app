# frozen_string_literal: true

# == Schema Information
#
# Table name: coworkers
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  campaign_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Coworker < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  delegate :name, to: :user
  delegate :email, to: :user
end
