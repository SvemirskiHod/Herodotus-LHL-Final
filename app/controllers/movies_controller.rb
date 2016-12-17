class MoviesController < ApplicationController

  def index
    render json: Movie.where(genre: include? "War")
  end

  def show
    @movie = Movie.find(params[:id])
    render json: @movie
  end




end
