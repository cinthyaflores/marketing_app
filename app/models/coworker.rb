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
#  role        :integer
#

class Coworker < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  delegate :name, to: :user
  delegate :email, to: :user

  enum role: { designer: 0, content_generator: 1 }
end
