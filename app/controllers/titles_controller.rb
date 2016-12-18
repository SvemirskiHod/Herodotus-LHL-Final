class TitlesController < ApplicationController

  # def index
  #   @movies = Movie.all
  #   render json: @movies
  #   # render json: search("genre", ["war", "drama"])
  # end

  def index
    puts params["name"]
    @result = Movie.all
    @result = @result.where("title LIKE ?", "%#{params["name"]}%").all
    render json: @result
  end


end
