# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :assign_task, only: %i[show edit update destroy]
  before_action :assign_post, only: %i[new index create destroy]

  def index
    @tasks = @post.tasks
  end

  def show; end

  def new
    @task = @post.tasks.new
    @coworkers = Campaign.find(@post.node.campaign_id).coworkers
  end

  def create
    @task = Task.create(task_params)

    if @task.persisted?
      flash[:notice] = 'Task was successfully created.'
    else
      flash[:error] = 'Task was unsuccessfully created.'
    end
    redirect_to post_path(@post)
  end

  def update
    if @task.update(task_params)
      redirect_to post_path(@post), notice: 'Task was successfully updated.'
    else
      redirect_to post_path(@post), error: 'Task was unsuccessfully updated.'
    end
  end

  def destroy
    if @task.destroy
      redirect_to post_path(@post), notice: 'Task was successfully deleted.'
    else
      redirect_to post_path(@post), error: 'Task was unsuccessfully deleted.'
    end
  end

  private

  def assign_task
    @task = Task.find(params[:id])
  end

  def assign_post
    @post = Post.find(params[:post_id])
  end

  def task_params
    params.require(:task).permit(:description, :deadline, :user_id, :post_id)
  end
end
