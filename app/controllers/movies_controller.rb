class MoviesController < ApplicationController

  def index
    @movies = Movie.all
    render json: @movies
  end

  def show
    params = {
      name: "caeser",
      genre: ["war", "drama"],
    }
    @movie = Movie.all
    @movie = @movie.where(name: params[:name]).all
    params[:genre].each do |element|
      @movie = @movie.where("genre LIKE ?", "%#{element.titleize}").all
    end

    render json: @movie
  end




end
