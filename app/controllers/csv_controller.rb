# frozen_string_literal: true
require 'csv'

class CsvController < ApplicationController
  def index
    @history = History.all

    respond_to do |format|
      format.csv { send_data @history.to_csv, filename: "history-at-#{Date.today}.csv" }
    end
  end
end
