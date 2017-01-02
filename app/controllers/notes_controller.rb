class NotesController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    puts "teststestetsete"
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
