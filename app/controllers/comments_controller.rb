class CommentsController < ApplicationController

  def create
    @comment = Comment.create(
      user_id: params[:user_id],
      movie_id: params[:movie_id],
      comment: params[:comment],
      username: params[:username],
    )

    render json: {"success": true, "new_comment": @comment}
  end

end
