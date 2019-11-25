# frozen_string_literal: true

class CalendarsController < ApplicationController
  def show
    @tasks = Task.by_user(current_user.id)
  end
end
