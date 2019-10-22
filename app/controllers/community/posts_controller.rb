# frozen_string_literal: true

module Community
  class PostsController < ApplicationController
    before_action :build_node
    before_action :verify_node, only: [:new]

    def new
      @post = @node.build_post
      respond_to do |format|
        format.json { render 'community/posts/new.js.erb' }
      end
    end

    def create
      @post = @node.build_post(title: params[:post][:title], user: current_user)
      @post.save
      respond_to do |format|
        format.js { render 'community/posts/create.js' }
      end
    end

    def edit
      @post = Post.find(params[:id])
      respond_to do |format|
        format.json { render 'community/posts/edit.js.erb' }
      end
    end

    def update
      @post = Post.find(params[:id])
      @post.update(title: params[:post][:title])
      respond_to do |format|
        format.js { render 'community/posts/update.js' }
      end
    end

    private

    def build_node
      @node = Node.find(params[:node_id])
    end

    def verify_node
      redirect_to action: :edit, id: @node.post, format: :json if @node.post
    end
  end
end
