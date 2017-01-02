class TitlesController < ApplicationController

  def index
    params["name"] = params["name"].downcase
    @result = Movie.all
    @result = @result.where("lower(title) LIKE ?", "%#{params["name"]}%").all
    render json: @result
  end
end