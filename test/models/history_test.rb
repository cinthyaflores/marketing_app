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


require 'test_helper'

class HistoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
