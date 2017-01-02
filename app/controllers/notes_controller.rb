class NotesController < ApplicationController

  def show
    # @user = User.find(params[:user_id])
    @movie = Movie.find(params[:movie_id])
    # puts "teststestetsete #{@movie.notes}"
    render json: {notes: @movie.notes}
  end

  def create
    @user = User.find(params[:user_id])
    @note = Note.create({
      user: @user,
      movie_id: params[:movie_id],
      note: params[:note]
    })
    render json: {type: 'note', note: @note}
  end
end
