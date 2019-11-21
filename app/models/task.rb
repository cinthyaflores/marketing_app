# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  description :string           not null
#  deadline    :datetime         not null
#  user_id     :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  post_id     :bigint           not null
#  category    :integer          default("content")
#  status      :integer          default("planned")
#  content     :string
#

class Task < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_one_attached :visual

  validates :category, presence: true

  enum category: {content:0, visual: 1}
  enum status: %i[planned in_progress completed approved]

  scope :by_user, ->(user_id) { where(user_id: user_id) }
end
