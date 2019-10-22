# frozen_string_literal: true

# == Schema Information
#
# Table name: corporations
#
#  id                       :bigint           not null, primary key
#  name                     :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  legal_representant_name  :string           not null
#  legal_representant_email :string           not null
#  legal_representant_phone :string           not null
#  legal_representant_role  :string           not null
#

require 'test_helper'

class CorporationTest < ActiveSupport::TestCase
  test 'corporation is valid with all attributes' do
    umbrella = Corporation.new(name: 'Umbrella',
                               legal_representant_name: 'Aaron Barreto',
                               legal_representant_email: 'arron@marketing.io',
                               legal_representant_phone: '312-002-0000',
                               legal_representant_role: 'CTO')

    assert umbrella.valid?
  end

  test 'corporation is not valid with no mame' do
    umbrella = Corporation.new(legal_representant_name: 'Aaron Barreto',
                               legal_representant_email: 'arron@marketing.io',
                               legal_representant_phone: '312-002-0000',
                               legal_representant_role: 'CTO')
    refute umbrella.valid?
  end

  test 'corporation is not valid with no legal representant name' do
    umbrella = Corporation.new(name: 'Umbrella',
                               legal_representant_email: 'arron@marketing.io',
                               legal_representant_phone: '312-002-0000',
                               legal_representant_role: 'CTO')
    refute umbrella.valid?
  end

  test 'corporation is not valid with no legal representant email' do
    umbrella = Corporation.new(name: 'Umbrella',
                               legal_representant_name: 'Aaron Barreto',
                               legal_representant_phone: '312-002-0000',
                               legal_representant_role: 'CTO')
    refute umbrella.valid?
  end

  test 'corporation is not valid with no legal representant phone' do
    umbrella = Corporation.new(name: 'Umbrella',
                               legal_representant_name: 'Aaron Barreto',
                               legal_representant_email: 'arron@marketing.io',
                               legal_representant_role: 'CTO')
    refute umbrella.valid?
  end

  test 'corporation is not valid with no legal representant role' do
    umbrella = Corporation.new(name: 'Umbrella',
                               legal_representant_name: 'Aaron Barreto',
                               legal_representant_email: 'arron@marketing.io',
                               legal_representant_phone: '312-002-0000')
    refute umbrella.valid?
  end
end
