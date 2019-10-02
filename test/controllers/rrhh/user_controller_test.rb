# frozen_string_literal: true

require 'test_helper'

module RRHH
  class UserControllerTest < ActionDispatch::IntegrationTest
    test 'rrhh user can visit dashboard' do
      login_as users(:rrhh)

      get rrhh_users_path
      assert_response :success
    end

    test 'no rrhh user can not access to dashboard' do
      login_as users(:designer)

      get rrhh_users_path
      assert_response :redirect
    end
  end
end
