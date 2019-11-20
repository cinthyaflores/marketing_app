# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :assign_post, only: %i[show edit update]

  def new
    @campaign_nodes = Campaign.find(params[:campaign_id]).nodes
    @post = Post.new
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

  private

  def post_params
    params.require(:post).permit(:node_id, :title, :body)
  end

  def assign_post
    @post = Post.find(params[:id])
  end
end
