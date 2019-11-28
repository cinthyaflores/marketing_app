# frozen_string_literal: true

class MyTasksController < ApplicationController
  before_action :assign_task, only: %i[show edit]
  before_action :assign_tasks, only: :index

  private

  def assign_tasks
    coworkers = Coworker.where(user_id: current_user.id)
    @tasks = []
    coworkers.each do |cw|
      @tasks << cw.tasks
    end
    @tasks.flatten!
  end

  def assign_task
    @task = Task.find(params[:id])
  end
end
