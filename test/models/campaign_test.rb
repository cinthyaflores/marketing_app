# frozen_string_literal: true

# == Schema Information
#
# Table name: campaigns
#
#  id           :bigint           not null, primary key
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  start_date   :date             not null
#  end_date     :date             not null
#  objective    :string
#  campaign_type :string           not null
#  product      :string
#  manager_id   :bigint
#  company_id   :integer
#  company_type :string
#

require 'test_helper'

class CampaignTest < ActiveSupport::TestCase
  setup do
    @image = Rack::Test::UploadedFile.new('test/fixtures/files/example.jpg', 'image/jpg')
  end

  test 'campaign is valid with all attributes' do
    vans = Campaign.new(name: 'Vans campaign',
                       start_date: Time.now,
                       end_date: Time.now - 1.day,
                       objective: 'Increase number of clients',
                       campaign_type: 'Positioning Positioning',
                       product: 'iPhone 11',
                       manager: users(:manager),
                       image: @image,
                       company: Company.first)

    assert vans.valid?
  end

  test 'campaign is not valid with no image' do
    vans = Campaign.new(name: 'Vans',
                       start_date: Time.now,
                       end_date: Time.now - 1.day,
                       objective: 'Posicionamiento',
                       campaign_type: 1,
                       product: 'iPhone 11',
                       manager: users(:manager))

    refute vans.valid?
  end

  test 'campaign is not valid with no name' do
    vans = Campaign.new(start_date: Time.now,
                       end_date: Time.now - 1.day,
                       objective: 'Posicionamiento',
                       campaign_type: 1,
                       product: 'iPhone 11',
                       manager: users(:manager),
                       image: @image)

    refute vans.valid?
  end

  test 'campaign is not valid with not start_date' do
    vans = Campaign.new(name: 'Vans',
                       end_date: Time.now - 1.day,
                       objective: 'Posicionamiento',
                       campaign_type: 1,
                       product: 'iPhone 11',
                       manager: users(:manager),
                       image: @image)

    refute vans.valid?
  end

  test 'campaign is not valid with no end_date' do
    vans = Campaign.new(name: 'Vans',
                       start_date: Time.now,
                       objective: 'Posicionamiento',
                       campaign_type: 1,
                       product: 'iPhone 11',
                       manager: users(:manager),
                       image: @image)

    refute vans.valid?
  end

  test 'campaign is not valid with no objective' do
    vans = Campaign.new(name: 'Vans',
                       start_date: Time.now,
                       end_date: Time.now - 1.day,
                       campaign_type: 1,
                       product: 'iPhone 11',
                       manager: users(:manager),
                       image: @image)

    refute vans.valid?
  end

  test 'campaign is not valid with no campaign_type' do
    vans = Campaign.new(name: 'Vans',
                       start_date: Time.now,
                       end_date: Time.now - 1.day,
                       objective: 'Posicionamiento',
                       product: 'iPhone 11',
                       manager: users(:manager),
                       image: @image)

    refute vans.valid?
  end

  test 'campaign is not valid with no product' do
    vans = Campaign.new(name: 'Vans',
                       start_date: Time.now,
                       end_date: Time.now - 1.day,
                       objective: 'Posicionamiento',
                       campaign_type: 1,
                       manager: users(:manager),
                       image: @image)

    refute vans.valid?
  end

  test 'campaign is not valid with no manager' do
    vans = Campaign.new(name: 'Vans',
                       start_date: Time.now,
                       end_date: Time.now - 1.day,
                       objective: 'Posicionamiento',
                       campaign_type: 1,
                       product: 'iPhone 11',
                       image: @image)

    refute vans.valid?
  end
end
