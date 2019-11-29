# frozen_string_literal: true

class ApprovePostController < ApplicationController
  def update
    @post = Post.find(params[:id])
    if @post.completed!
      redirect_to post_path(@post), notice: 'Post satisfactoriamente aprobado'
    else
      redirect_to post_path(@post), error: 'Hubo un problema al aprobar el post'
    end
  end
end
