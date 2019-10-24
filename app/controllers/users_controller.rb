# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :assign_user, except: %i[new index]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    user = User.invite!(user_params)
    if user.valid?
      flash[:notice] = 'El usuario fue registrado correctamente'
    else
      flash[:alert] = 'Error registrando al usuario'
    end
    redirect_to users_path
  end

  private

  def assign_user
    @user ||= User.find(params[:id])
  end

  def role_mask
    User.mask_for params[:user][:roles_mask].map(&:to_sym)
  end

  def user_params
    params.require(:user).permit(:email, :name).merge!(roles_mask: role_mask,
                                                       company: current_user.company)
  end
end
