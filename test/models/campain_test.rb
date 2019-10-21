# frozen_string_literal: true

# == Schema Information
#
# Table name: campains
#
#  id           :bigint           not null, primary key
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  start_date   :date             not null
#  end_date     :date             not null
#  objective    :string
#  campain_type :integer          not null
#  product      :string
#  manager_id   :bigint
#


require 'test_helper'

class CampainTest < ActiveSupport::TestCase
  test 'campain is valid with name' do
    vans = Campain.new(name: 'Vans',
                       start_date: Time.now,
                       end_date: Time.now - 1.day,
                       objective: 'Posicionamiento',
                       campain_type: 1,
                       product: 'iPhone 11',
                       manager: users(:manager))

    assert vans.valid?
  end

  test 'campain is not valid with no name' do
    vans = Campain.new(start_date: Time.now,
                       end_date: Time.now - 1.day,
                       objective: 'Posicionamiento',
                       campain_type: 1,
                       product: 'iPhone 11',
                       manager: users(:manager))

    refute vans.valid?
  end

  test 'campain is not valid with not start_date' do
    vans = Campain.new(name: 'Vans',
                       end_date: Time.now - 1.day,
                       objective: 'Posicionamiento',
                       campain_type: 1,
                       product: 'iPhone 11',
                       manager: users(:manager))

    refute vans.valid?
  end
  test 'campain is not valid with no end_date' do
    vans = Campain.new(name: 'Vans',
                       start_date: Time.now,
                       objective: 'Posicionamiento',
                       campain_type: 1,
                       product: 'iPhone 11',
                       manager: users(:manager))

    refute vans.valid?
  end

  test 'campain is not valid with no objective' do
    vans = Campain.new(name: 'Vans',
                       start_date: Time.now,
                       end_date: Time.now - 1.day,
                       campain_type: 1,
                       product: 'iPhone 11',
                       manager: users(:manager))

    refute vans.valid?
  end

  test 'campain is not valid with no campain_type' do
    vans = Campain.new(name: 'Vans',
                       start_date: Time.now,
                       end_date: Time.now - 1.day,
                       objective: 'Posicionamiento',
                       product: 'iPhone 11',
                       manager: users(:manager))

    refute vans.valid?
  end

  test 'campain is not valid with no product' do
    vans = Campain.new(name: 'Vans',
                       start_date: Time.now,
                       end_date: Time.now - 1.day,
                       objective: 'Posicionamiento',
                       campain_type: 1,
                       manager: users(:manager))

    refute vans.valid?
  end

  test 'campain is not valid with no manager' do
    vans = Campain.new(name: 'Vans',
                       start_date: Time.now,
                       end_date: Time.now - 1.day,
                       objective: 'Posicionamiento',
                       campain_type: 1,
                       product: 'iPhone 11')

    refute vans.valid?
  end
end
