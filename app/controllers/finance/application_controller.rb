# frozen_string_literal: true

module Finance
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin

    def authenticate_admin
      unless user_signed_in? && (current_user.is_finance? || current_user.owner?)
        redirect_to root_path
      end
    end
  end
end
