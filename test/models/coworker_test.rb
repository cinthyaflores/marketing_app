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

require 'test_helper'

class CoworkerTest < ActiveSupport::TestCase
  setup do
    @designer = users(:designer)
    @iphone_campain = campains(:iphone_campain)
  end

  test 'coworker is valid with all attribute' do
    coworker = Coworker.new(user: @designer,
                            role: 1,
                            campain: @iphone_campain)

    assert coworker.valid?
  end

  test 'coworker is not valid with no user relation' do
    coworker = Coworker.new(role: 1,
                            campain: @iphone_campain)

    refute coworker.valid?
  end

  test 'coworker is not valid with no role attribute' do
    coworker = Coworker.new(user: @designer,
                            campain: @iphone_campain)

    refute coworker.valid?
  end

  test 'coworker is valid with no campain relation' do
    coworker = Coworker.new(user: @designer,
                            role: 1)

    refute coworker.valid?
  end
end
