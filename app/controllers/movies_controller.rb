class MoviesController < ApplicationController

  def index
    @movies = Movie.all

    case params[:category]
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
    when 'Before Common Era'
      @movies = @movies.where("start_ad_bc = 'BC'").all
    when 'Animation'
      @movies = @movies.where("genre LIKE ?", "%Animation%").all
    when 'World War 2'
      @movies = @movies.where("genre LIKE ?", "%War%").all
      @movies = @movies.where("set_start_year >= ?", 1939).where("set_end_year <= ?", 1945).all
    end

    render json: @movies
  end

  def show
    @movie = Movie.find(params[:id])
    render json: {comments: @movie.comments}
  end

  def create
    # Movie.create({
    #   title:
    #   year:
    #   rated:
    #   released:
    #   runtime:
    #   genre:
    #   director:
    #   writer:
    #   actors:
    #   plot:
    #   language:
    #   country:
    #   awards:
    #   poster:
    #   metascore:
    #   imdbrating:
    #   imdbid:
    #   keywords:
    #   set_start_year:
    #   start_ad_bc:
    #   set_start_year_accurate:
    #   set_end_year:
    #   end_ad_bc:
    #   set_end_year_accurate:
    #   setting_location:
    # })
  end
end
