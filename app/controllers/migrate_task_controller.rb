# frozen_string_literal: true

class MigrateTaskController < ApplicationController
  def update
    @task = Task.find(params[:id])
    if update_post
      redirect_to post_path(@task.post), notice: 'Task was successfully migrated.'
    else
      redirect_to post_path(@task.post), error: 'Task was unsuccessfully migrated.'
    end
  end

  private

  def update_post
    if @task.content?
      @task.post.update(body: @task.content)
    else
      @task.post.update(content: @task.visual)
    end
  end
end
