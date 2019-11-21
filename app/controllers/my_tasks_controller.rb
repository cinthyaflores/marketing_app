# frozen_string_literal: true

class MyTasksController < ApplicationController
  before_action :assign_task, only: %i[show edit update]
  def index
    @tasks = Task.by_user(current_user.id)
  end

  def update
    if @task.update(task_params)
      redirect_to my_tasks_path(@post), notice: 'Task was successfully updated.'
    else
      redirect_to my_tasks_path(@post), error: 'Task was unsuccessfully updated.'
    end
  end

  private

  def assign_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:content, :visual)
  end
end
