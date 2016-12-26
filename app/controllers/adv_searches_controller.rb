class AdvSearchesController < ApplicationController

  def index  # Will handle advanced searches

    title = params["title"] if params["title"]
    genre = params["genre"] if params["genre"]
    user_submitted_keywords = params["keywords"].split.map!(&:downcase) if params["keywords"]
    set_start_year = params["date"] if params["date"]
    location = params["location"]
    era = params["era"]

    @results = Movie.all
    @results = @results.where("lower(title) LIKE ?", "%#{title.downcase}%").all if title != ""
    @results = @results.where("lower(genre) LIKE ?", "%#{genre.downcase}%").all if genre != ""
    @results = @results.where("lower(setting_location) LIKE ?", "%#{location.downcase}%").all if location != ""
    @results = @results.where("start_ad_bc = '#{era}'").all if era != ""


    if (era.downcase == 'bc')
      @results = @results.where("set_start_year = #{set_start_year}").all if set_start_year != ""
    else
        @movies = @movies.where("set_start_year >= ?", set_start_year.to_i).where("set_end_year <= ?", set_start_year.to_i).all
    end

    movies = []
    @results.each do |film|
      keywords = JSON.parse(film["keywords"])
      if (user_submitted_keywords - keywords).empty?
        movies << film
      end
    end
    render json: movies
  end

end
