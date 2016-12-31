class CommentsController < ApplicationController

  def create
    Comment.create(
      user_id: params[:user_id],
      movie_id: params[:movie_id],
      comment: params[:comment],
      username: params[:username],
    )

    render json: {"success": true}
  end

end
