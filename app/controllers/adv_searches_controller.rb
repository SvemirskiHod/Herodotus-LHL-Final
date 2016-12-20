class AdvSearchesController < ApplicationController

  def index  # Will handle advanced searches

    title = params["title"] if params["title"]
    genre = params["genre"] if params["genre"]
    keywords = params["keywords"] if params["keywords"]
    released = params["date"] if params["date"]

    @movie = Movie.all
    @movie = @movie.where("lower(title) LIKE ?", "%#{title.downcase}%").all if params["title"] != ""
    @movie = @movie.where("lower(genre) LIKE ?", "%#{genre.downcase}%").all if params["genre"] != ""
    @movie = @movie.where("lower(keywords) LIKE ?", "%#{keywords.downcase}%").all if params["keywords"] != ""
    @movie = @movie.where("lower(released) LIKE ?", "%#{released.downcase}%").all if params["date"] != ""

    # @movie = Movie.all
    # @movie = @movie.where("lower(title) LIKE ?", "%#{params[:title].downcase}%").all
    # params[:genre].each do |element|
    #   @movie = @movie.where("genre LIKE ?", "%#{element.titleize}%").all
    # end

    render json: @movie
  end


end
