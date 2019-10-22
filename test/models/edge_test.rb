# frozen_string_literal: true

# == Schema Information
#
# Table name: edges
#
#  id         :bigint           not null, primary key
#  from_id    :bigint
#  to_id      :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class EdgeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
