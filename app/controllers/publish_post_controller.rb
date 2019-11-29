# frozen_string_literal: true

class PublishPostController < ApplicationController
  def update
    @post = Post.find(params[:id])
    # publicar jeje
    # if @post.completed!
    #   redirect_to post_path(@post), notice: 'Post satisfactoriamente aprobado'
    # else
    #   redirect_to post_path(@post), error: 'Hubo un problema al aprobar el post'
    # end
  end
end
