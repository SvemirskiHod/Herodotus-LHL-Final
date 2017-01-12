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
    when 'Vintage (released before 1970)'
      @movies = @movies.where("year <= ?", 1970).all
    when 'Films Set Before the Common Era (BCE)'
      @movies = @movies.where("start_ad_bc = ?", "BCE").all
    when 'Animated Films'
      @movies = @movies.where("genre LIKE ?", "%Animation%").all
    when 'Films Set During WWII'
      @movies = @movies.where("genre LIKE ?", "%War%").all
      @movies = @movies.where("set_start_year >= ?", 1939).where("set_end_year <= ?", 1945).all
    when 'Set in China'
      @movies = @movies.where("setting_location LIKE ?", "%China%").all
    when 'Recent Releases'
      @movies = @movies.where("year >= ?", 2012).all
    when 'Set in Middle Ages'
      @movies = @movies.where("set_start_year >= ?", 500).where("set_start_year <= ?", 1500).all
    when 'Films set in this Millennium'
      @movies = @movies.where("year >= ?", 2000).all
    when 'Critically Acclaimed Films'
      @movies = @movies.where("imdbrating >= ?", 8).all
    when 'Set in Ancient Rome or Greece'
      @movies = @movies.where(["setting_location LIKE ? OR setting_location LIKE ? OR setting_location LIKE ?", "%Rome%", "%Italy%", "%Greece%"]).all#.where(["start_ad_bc = ? AND set_start_year <= ?", "BCE", 800]).where(["start_ad_bc = ? AND set_start_year = ?", 'BCE', 0]).all#where(["start_ad_bc = ? AND set_start_year <= ?", "CE", 300]).all
      movies_in_BCE = []
      movies_in_CE = []
      movies_in_BCE = @movies.where(["start_ad_bc = ? AND set_start_year <= ? AND set_start_year >= ?", "BCE", 800, 0]).all
      movies_in_CE = @movies.where(["start_ad_bc = ? AND set_start_year <= ? AND set_start_year >= ?", "CE", 300, 0]).all
      @movies = movies_in_CE + movies_in_BCE
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
