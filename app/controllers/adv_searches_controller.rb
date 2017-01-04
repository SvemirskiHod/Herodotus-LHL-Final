class AdvSearchesController < ApplicationController
  def index  # Will handle advanced searches

    title = params["title"] if params["title"] != ''
    genre = params["genre"] if params["genre"] != ''
    user_submitted_keywords = params["keywords"].split.map!(&:downcase) if params["keywords"] != ''
    set_start_year = params["date"] if params["date"] != ''
    location = params["location"] if params["location"] != ''
    era = params["era"] if params["era"] != ''

    @results = Movie.all
    @results = @results.where("lower(title) LIKE ?", "%#{title.downcase}%").all if title
    @results = @results.where("lower(genre) LIKE ?", "%#{genre.downcase}%").all if genre
    @results = @results.where("lower(setting_location) LIKE ?", "%#{location.downcase}%").all if location
    @results = @results.where("start_ad_bc = '#{era}'").all if era
    @results = @results.where("lower(setting_location) LIKE ?", "%#{location.downcase}%").all if location
    movies = []

    if (era == 'BC')
      @results = @results.where("set_start_year = #{set_start_year}").all if set_start_year
    else
      @results = @results.where("set_start_year >= ?", set_start_year).where("set_end_year <= ?", set_start_year).all if set_start_year
    end

    movies = []
    @results.each do |film|
      keywords = JSON.parse(film["keywords"])
      if (user_submitted_keywords - keywords).empty?
        movies << film
      end
    end if user_submitted_keywords

    if (movies.length > 0)
      @results = movies
    end

    # CODE THAT PUTS THE RESULTS IN CHRONOLOGICAL ORDER
    bcArray = []
    adArray = []

    @results.each do |film|
      if (film.start_ad_bc == 'BC')
        bcArray << film
      elsif (film.start_ad_bc == 'AD')
        adArray << film
      end
    end

    adArray = adArray.sort { |a,b| a.set_start_year.to_i <=> b.set_start_year.to_i }
    bcArray = bcArray.sort { |a,b| b.set_start_year.to_i <=> a.set_start_year.to_i }
    @results = bcArray + adArray
    # END OF CODE
    render json: @results

  end
end
