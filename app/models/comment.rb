# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :string
#  task_id    :bigint
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :task

  delegate :name, to: :user, prefix: true
end
