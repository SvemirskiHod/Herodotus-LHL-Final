class NotesController < ApplicationController
  def index
  end

  def show
    @notes = Note.where(movie_id: params[:movie_id]).where(user_id: params[:user_id]).all
    render json: {notes: @notes}
  end

  def create
    @user = User.find(params[:user_id])
    @note = Note.create({
      user: @user,
      movie_id: params[:movie_id],
      note: params[:note],
    })
    render json: {type: 'note', note: @note}
  end
end
