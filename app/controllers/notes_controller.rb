class NotesController < ApplicationController
  def index
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

  def destroy
    @movie = Movie.find(params[:movie_id])
    @note = @movie.notes.find(params[:id])
    @note.destroy
    @notes = Note.where(movie_id: params[:movie_id]).where(user_id: params[:user_id]).all
    render json: {notes: @notes}
  end

  def update
    @movie = Movie.find(params[:movie_id])
    Note.find(params[:id]).update(note: params[:note])
    @notes = Note.where(movie_id: params[:movie_id]).where(user_id: params[:user_id]).all
    render json: {type: 'editedNote', notes: @notes}
  end
end
