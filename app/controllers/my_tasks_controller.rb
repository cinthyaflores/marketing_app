# frozen_string_literal: true

class MyTasksController < ApplicationController
  before_action :assign_task, only: %i[show edit]
  def index
    @tasks = Task.by_user(current_user.id)
  end

  private

  def assign_task
    @task = Task.find(params[:id])
  end
end
