# frozen_string_literal: true

# == Schema Information
#
# Table name: clients
#
#  id             :bigint           not null, primary key
#  user_id        :bigint
#  corporation_id :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
