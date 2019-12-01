# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :assign_post, only: %i[show edit update destroy]

  def new
    @campaign_nodes = Campaign.find(params[:campaign_id]).nodes
    @post = Post.new
  end

  def show
    @not_finished_tasks = @post.tasks.not_finished
    @finished_tasks = @post.tasks.completed
    @approved_tasks = @post.tasks.approved
  end

  def edit
    @campaign_nodes = @post.node.network.nodes
  end

  def index
    @campaign = Campaign.find(params[:campaign_id])
    @posts = @campaign.posts
  end

  def create
    post = Post.create(post_params)
    if post.persisted?
      flash[:notice] = 'La publicación fue registrada correctamente'
    else
      errors = post.errors.full_messages.join(',')
      flash[:error] = "Error registrando la publicación: #{errors}"
    end
    redirect_to post_path(post)
  end

  def update
    if @post.update(post_params)
      flash[:notice] = 'La publicación fue actualizada correctamente'
    else
      errors = @post.errors.full_messages.join(',')
      flash[:error] = "Error registrando la publicación: #{errors}"
    end
    redirect_to campaign_posts_path(@post.node.campaign_id)
  end

  def destroy
    campaign = Campaign.find(@post.node.campaign_id)
    if @post.destroy
      flash[:notice] = 'La publicación fue eliminada correctamente'
    else
      errors = @post.errors.full_messages.join(',')
      flash[:error] = "Error eliminando la publicación: #{errors}"
    end
    redirect_to campaign_posts_path(campaign)
  end

  private

  def post_params
    params.require(:post).permit(:node_id, :title, :body, :publish_date, :content, :status)
  end

  def assign_post
    @post = Post.find(params[:id])
  end
end
