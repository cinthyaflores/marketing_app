# frozen_string_literal: true

# == Schema Information
#
# Table name: nodes
#
#  id         :bigint           not null, primary key
#  label      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  color      :string
#  network_id :bigint
#

require 'test_helper'

class NodeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
