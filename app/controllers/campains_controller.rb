# frozen_string_literal: true

class CampainsController < ApplicationController
  def new
    @campain = Campain.new
  end

  def create
    campain = Campain.create(campain_params)
    if campain.persisted?
      flash[:notice] = 'La campaña fue registrada correctamente'
    else
      errors = campain.errors.full_messages.join(',')
      flash[:error] = "Error registrando la campaña: #{errors}"
    end
    redirect_to campains_path
  end

  def index
    @campains = Campain.all
  end

  private

  def campain_params
    params.require(:campain).permit(:name,
                                    :manager_id,
                                    :product,
                                    :company_id,
                                    :objective,
                                    :campain_type,
                                    :start_date,
                                    :end_date,
                                    :image)
  end
end
