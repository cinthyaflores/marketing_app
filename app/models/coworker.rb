# frozen_string_literal: true

# == Schema Information
#
# Table name: coworkers
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  campain_id :bigint           not null
#  role       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Coworker < ApplicationRecord
  belongs_to :user
  belongs_to :campain
  delegate :email, to: :user
  validates :role, presence: true

  enum roles: %i[content_creator designer]
end
