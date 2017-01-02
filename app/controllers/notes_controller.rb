class NotesController < ApplicationController

  def show
    @movie = Movie.find(params[:movie_id])
    @user = User.find(params[:user_id])
    puts "testsetst #{@user.notes}"
    render json: {notes: @movie.notes}
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
