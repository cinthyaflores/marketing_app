# frozen_string_literal: true

class ApprovePostController < ApplicationController
  def update
    @post = Post.find(params[:id])
    if @post.completed! && FacebookManager.publish_post(@post)
      flash[:notice] = 'Post satisfactoriamente aprobado'
    else
      flash[:error] = 'Hubo un problema al aprobar el post'
    end
    redirect_to post_path(@post)
  end
end
