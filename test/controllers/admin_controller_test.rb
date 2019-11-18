# frozen_string_literal: true

require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test 'admin can get ccampaigns dashboard' do
    login_as users(:owner)

    get admin_campaigns_path
    assert_response :success
  end

  test 'no admin user can not access to dashboard' do
    login_as users(:designer)

    get admin_campaigns_path
    assert_response :redirect
  end
end
