# frozen_string_literal: true

class CalendarsController < ApplicationController
  def show
    @tasks = []
    coworkers = Coworker.where(user_id: current_user.id)
    coworkers.each do |cw|
      @tasks << cw.tasks
    end
    @tasks.flatten!
  end
end
