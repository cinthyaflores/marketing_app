# frozen_string_literal: true

class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    if @comment.persisted?
      flash[:notice] = 'Comentario was successfully created.'
    else
      flash[:error] = 'Comentario was unsuccessfully created.'
    end
    redirect_to request.env['HTTP_REFERER']
  end

  private

  def comment_params
    params.require(:comment).permit(:task_id, :user_id, :content)
  end
end
