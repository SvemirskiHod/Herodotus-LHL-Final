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
      @movies = @movies.where("start_ad_bc = ?", "BCE").all
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
    Movie.create(
      title: params[:title],
      year: params[:releaseYear],
      rated: params[:rating],
      released: params[:releaseDate],
      runtime: params[:runtime],
      genre: params[:genre],
      director: params[:director],
      writer: params[:writer],
      actors: params[:actors],
      plot: params[:plot],
      language: params[:language],
      country: params[:country],
      awards: params[:awards],
      poster: params[:poster],
      metascore: params[:metascore],
      imdbrating: params[:imdbrating],
      keywords: params[:keywords],
      set_start_year: params[:startYear],
      start_ad_bc: params[:startADBC],
      set_start_year_accurate: params[:startAccurate],
      set_end_year: params[:endYear],
      end_ad_bc: params[:endADBC],
      set_end_year_accurate: params[:endAccurate],
      setting_location: params[:setting],
    )
  end
end
