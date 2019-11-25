# frozen_string_literal: true

class ApproveTaskController < ApplicationController
  def update
    @task = Task.find(params[:id])
    if @task.approved!
      redirect_to post_path(@task.post), notice: 'Task was successfully approved.'
    else
      redirect_to post_path(@task.post), error: 'Task was unsuccessfully approved.'
    end
  end
end
