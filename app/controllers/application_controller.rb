# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, if: :not_root
  before_action :log

  private

  def not_root
    params[:controller] != 'landing_page'
  end

  def log
    History.create(content: params.to_s, user: current_user.inspect.to_s)
  end
end
