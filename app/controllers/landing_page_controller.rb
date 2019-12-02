# frozen_string_literal: true

class LandingPageController < ApplicationController
  def index
    @corporations = Corporation.all
    @companies = Company.all
    if !current_user
      render layout: 'landing_page'
    end
  end
end
