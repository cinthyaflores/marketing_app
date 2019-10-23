# frozen_string_literal: true

module Finance
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin

    def authenticate_admin
      redirect_to root_path unless user_signed_in? && (current_user.is_finance? || current_user.owner?)
    end
  end
end
