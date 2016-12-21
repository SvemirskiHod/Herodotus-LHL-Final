class MoviesController < ApplicationController

  def index
    @movies = Movie.all

    case params[:genre]
    when 'Drama'
      @movies = @movies.where("genre LIKE ?", "%Drama%").all
    when 'Action'
      @movies = @movies.where("genre LIKE ?", "%Action%").all
    when 'Biography'
      @movies = @movies.where("genre LIKE ?", "%Biography%").all
    when 'Set in Japan'
      @movies = @movies.where("setting_location LIKE ?", "%Japan%").all
    when 'Vintage'
      @movies = @movies.where("year <= ?", 1970).all
    when 'Before CE'
      @movies = @movies.where("start_ad_bc = 'BC'").all
    when 'Animation'
      @movies = @movies.where("genre LIKE ?", "%Animation%").all
    end

    render json: @movies
  end

#   def show  # Will handle advanced searches

#     title = params.title
#     # genre = params.genre
#     # keywords = params.keywords
#     # date = params.date

#     @movie = Movie.all
#     @movie = @movie.where("lower(title) LIKE ?", "%#{title.downcase}%").all

#     # @movie = Movie.all
#     # @movie = @movie.where("lower(title) LIKE ?", "%#{params[:title].downcase}%").all
#     # params[:genre].each do |element|
#     #   @movie = @movie.where("genre LIKE ?", "%#{element.titleize}%").all
#     # end

#     render json: @movie

end

def search(field, search_params)
    @result = Movie.all
    search_params.each do |element|
      @result = @result.where("#{field} LIKE ?", "%#{element.titleize}%").all if element.present?
    end
    @result
end
