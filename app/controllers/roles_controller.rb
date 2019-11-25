# frozen_string_literal: true

class RolesController < ApplicationController
  def show
    roles = User.find(params[:user_id]).roles
    render json: { roles: roles }
  end
end
