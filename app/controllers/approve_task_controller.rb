# frozen_string_literal: true

class ApproveTaskController < ApplicationController
  def update
    @task = Task.find(params[:id])
    if @task.approved! && update_post
      redirect_to post_path(@task.post), notice: 'Task was successfully approved.'
    else
      redirect_to post_path(@task.post), error: 'Task was unsuccessfully approved.'
    end
  end

  private

  def update_post
    post = Post.find(@task.post.id)
    if @task.visual?
      post.update(content: @task.visual)
    else
      post.update(body: @task.content)
    end
  end
end
