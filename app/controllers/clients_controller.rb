# frozen_string_literal: true

class ClientsController < ApplicationController
  def index
    @corporations = Corporation.all
    @companies = Company.all
  end
end
