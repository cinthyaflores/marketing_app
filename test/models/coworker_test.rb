# frozen_string_literal: true

# == Schema Information
#
# Table name: coworkers
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  campaign_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class CoworkerTest < ActiveSupport::TestCase
  setup do
    @designer = users(:designer)
    @iphone_campaign = campaigns(:iphone_campaign)
  end

  test 'coworker is valid with all attribute' do
    coworker = Coworker.new(user: @designer,
                            role: 1,
                            campaign: @iphone_campaign)

    assert coworker.valid?
  end

  test 'coworker is not valid with no user relation' do
    coworker = Coworker.new(role: 1,
                            campaign: @iphone_campaign)

    refute coworker.valid?
  end

  test 'coworker is not valid with no role attribute' do
    coworker = Coworker.new(user: @designer,
                            campaign: @iphone_campaign)

    refute coworker.valid?
  end

  test 'coworker is valid with no campaign relation' do
    coworker = Coworker.new(user: @designer,
                            role: 1)

    refute coworker.valid?
  end
end
