# frozen_string_literal: true

require 'test_helper'

module Admin
  class CampaignsControllerTest < ActionDispatch::IntegrationTest
    test 'it response success when owner accces to dashboard' do
      login_as users(:owner)

      get admin_campaigns_path

      assert_response :success
    end

    test 'it redirect when no owner acces to dashboard' do
      login_as users(:rrhh)

      get admin_campaigns_path

      assert_response :redirect
    end

    test 'it response success when owner access to a campaign' do
      campaign = campaigns(:iphone_campaign)
      login_as users(:owner)

      get admin_campaign_path(campaign)

      assert_response :success
    end

    test 'it response success when owner access to new campaign' do
      login_as users(:owner)

      get new_admin_campaign_path

      assert_response :success
    end

    test 'it response success when owner acccess to campaign edit' do
      campaign = campaigns(:iphone_campaign)
      login_as users(:owner)

      get edit_admin_campaign_path(campaign)

      assert_response :success
    end
  end
end
