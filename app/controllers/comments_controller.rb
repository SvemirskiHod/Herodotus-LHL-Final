class CommentsController < ApplicationController

  def create
    @comment = Comment.create(
      user_id: params[:user_id],
      movie_id: params[:movie_id],
      comment: params[:comment],
      username: params[:username],
    )
    render json: {type: 'comment', new_comment: @comment}
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.find(params[:id])
    @comment.destroy

    render json: {comments: @movie.comments}
  end

  def update
    @movie = Movie.find(params[:movie_id])
    Comment.find(params[:id]).update(comment: params[:comment])
    # @comment.update(comment: params[:comment])

    render json: {type: 'editedComment', comments: @movie.comments.order(id: :asc)}
  end
end
