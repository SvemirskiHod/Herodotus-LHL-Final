class MoviesController < ApplicationController



  def index
    render json: Movie.all
  end


  def index


    render json: search("genre", ["war", "drama"])

  end

  def show
    @movie = Movie.find(params[:id])
    render json: @movie
  end

end

def search(field, search_params)
    # genre[0] = genre[0].capitalize
    @result = Movie.all
    search_params.each do |element|
      @result = @result.where("#{field} LIKE ?", "%#{element.titleize}%").all if element.present?
    end
    @result
end
