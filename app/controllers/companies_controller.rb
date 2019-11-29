# frozen_string_literal: true

class CompaniesController < ApplicationController
  before_action :assign_company, except: %i[new create index]

  def new
    @company = Company.new
  end

  def create
    company = Company.create(company_params)
    if company.persisted?
      flash[:notice] = 'La compañía fue registrada correctamente'
    else
      errors = company.errors.full_messages.join(',')
      flash[:error] = "Error registrando la compañía: #{errors}"
    end
    redirect_to clients_path
  end

  def update
    if @company.update(company_params)
      flash[:notice] = 'La compañía fue actualizada correctamente'
    else
      flash[:error] = 'Error actualizando la compañía'
    end
    redirect_to clients_path
  end

  private

  def company_params
    params.require(:company).permit(:name,
                                    :legal_representant_name,
                                    :legal_representant_email,
                                    :legal_representant_phone,
                                    :legal_representant_role,
                                    :bussines_name,
                                    :rfc,
                                    :location,
                                    :corporation_id)
  end

  def assign_company
    @company ||= Company.find(params[:id])
  end
end
