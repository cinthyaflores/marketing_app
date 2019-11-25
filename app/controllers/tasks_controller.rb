# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :assign_task, only: %i[show edit update destroy]
  before_action :assign_post, only: %i[new index create destroy edit update]
  before_action :assign_coworkers, only: %i[new edit]
  before_action :sanitize_task_params, only: %i[create update]

  def index
    @not_finished_tasks = @post.tasks.not_finished
    @finished_tasks = @post.tasks.completed
    @approved_tasks = @post.tasks.approved
  end

  def new
    @task = @post.tasks.new
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
      redirect_to request.env['HTTP_REFERER'], notice: 'Task was successfully updated.'
    else
      redirect_to request.env['HTTP_REFERER'], error: 'Task was unsuccessfully updated.'
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

  def assign_coworkers
    @coworkers = Campaign.find(@post.node.campaign_id).coworkers
  end

  def sanitize_task_params
    params[:task][:category] = params[:task][:category].to_i
    params[:task][:status] = params[:task][:status].to_i
  end

  def task_params
    params.require(:task).permit(:description,
                                 :deadline,
                                 :user_id,
                                 :post_id,
                                 :category,
                                 :status,
                                 :content,
                                 :visual)
  end
end
