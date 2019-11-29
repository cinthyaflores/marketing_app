# frozen_string_literal: true

class CorporationsController < ApplicationController
  before_action :assign_corporation, except: %i[new index create]

  def new
    @corporation = Corporation.new
  end

  def create
    corporation = Corporation.create(corporation_params)
    if corporation.persisted?
      flash[:notice] = 'La corporación fue registrada correctamente'
    else
      errors = corporation.errors.full_messages.join(',')
      flash[:error] = "Error registrando la corporación: #{errors}"
    end
    redirect_to clients_path
  end

  def update
    if @corporation.update(corporation_params)
      flash[:notice] = 'La corporación fue actualizada correctamente'
    else
      flash[:error] = 'Error actualizando la corporación'
    end
    redirect_to clients_path
  end

  private

  def corporation_params
    params.require(:corporation).permit(:name,
                                        :legal_representant_name,
                                        :legal_representant_email,
                                        :legal_representant_phone,
                                        :legal_representant_role)
  end

  def assign_corporation
    @corporation ||= Corporation.find(params[:id])
  end
end
