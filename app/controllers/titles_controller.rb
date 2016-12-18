class TitlesController < ApplicationController

  # def index
  #   @movies = Movie.all
  #   render json: @movies
  #   # render json: search("genre", ["war", "drama"])
  # end

  def index
    params["name"] = params["name"].downcase
    @result = Movie.all
    @result = @result.where("lower(title) LIKE ?", "%#{params["name"]}%").all
    render json: @result
  end


end
