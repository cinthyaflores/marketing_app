# frozen_string_literal: true

module Community
  class NetworkController < ActionController::Base
    def new
      binding.pry
    end

    def authenticate_admin
      redirect_to root_path unless user_signed_in? && current_user.is_community_manager?
    end
  end
end
