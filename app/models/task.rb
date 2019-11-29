# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  description :string           not null
#  deadline    :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  post_id     :bigint           not null
#  category    :integer          default("content")
#  status      :integer          default("planned")
#  content     :string
#  title       :string
#  coworker_id :bigint
#

class Task < ApplicationRecord
  belongs_to :post
  belongs_to :coworker
  has_many :comments, dependent: :destroy
  has_one_attached :visual

  validates :category, presence: true

  alias_attribute :start_time, :deadline
  alias_attribute :start_date, :deadline

  enum category: { content: 0, visual: 1 }
  enum status: { planned: 0, in_progress: 1, completed: 2, approved: 3 }

  scope :by_user, ->(user_id) { where(user_id: user_id) }
  scope :not_finished, -> { where(status: [0, 1]) }
end
