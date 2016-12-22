class MoviesController < ApplicationController



  def index
    render json: Movie.all
  end

  def show
    render json: Movie.find(params[:id])
  end


  # def index
  #   @movies = Movie.all
  #   render json: @movies
  #   # render json: search("genre", ["war", "drama"])
  # end


  #
  # def index #Techinically the Def show
  #   params = {
  #     title: "the",
  #     genre: ["action", "drama"],
  #   }
  #
  #   @movie = Movie.all
  #   @movie = @movie.where("lower(title) LIKE ?", "%#{params[:title].downcase}%").all
  #   params[:genre].each do |element|
  #     @movie = @movie.where("genre LIKE ?", "%#{element.titleize}%").all
  #   end
  #
  #   render json: @movie
  # end


end

def search(field, search_params)
    # genre[0] = genre[0].capitalize
    @result = Movie.all
    search_params.each do |element|
      @result = @result.where("#{field} LIKE ?", "%#{element.titleize}%").all if element.present?
    end
    @result
end
