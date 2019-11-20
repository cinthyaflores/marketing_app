# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  body       :text
#  node_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  belongs_to :node
  has_one_attached :content
  has_many :tasks

  validates :title, presence: true
end
