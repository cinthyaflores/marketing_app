# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :assign_user, except: %i[new create index]
  before_action :assign_users, only: %i[new edit]

  def new
    @user = User.new
  end

  def index
    @users = if current_user.owner?
               User.all
             elsif current_user.admin?
               User.admin_manage_users(current_user.company)
             end
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

  def update
    if @user.update(user_params)
      flash[:notice] = 'El usuario fue actualizado correctamente'
    else
      flash[:alert] = 'Error actualizando al usuario'
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
    company = if params[:user][:company].present?
                Company.find(params[:user][:company].to_i)
              else
                current_user.company
              end
    params.require(:user).permit(:email, :name).merge!(roles_mask: role_mask,
                                                       company: company)
  end

  def assign_users
    @users = if current_user.owner?
               User.owner_manage_roles
             elsif current_user.admin?
               User.admin_manage_roles
             end
  end
end
