class AdvSearchesController < ApplicationController
  def index  # Will handle advanced searches

    title = params["title"] if params["title"] != ''
    genre = params["genre"] if params["genre"] != ''
    user_submitted_keywords = params["keywords"].split.map!(&:downcase) if params["keywords"] != ''
    set_start_year = params["date"] if params["date"] != ''
    location = params["location"] if params["location"] != ''
    era = params["era"] if params["era"] != ''
    start_date = params["start_date"] if params["start_date"] != ''
    end_date = params["end_date"] if params["end_date"] != ''


    @results = Movie.all
    @results = @results.where("lower(title) LIKE ?", "%#{title.downcase}%").all if title
    @results = @results.where("lower(genre) LIKE ?", "%#{genre.downcase}%").all if genre
    @results = @results.where("lower(setting_location) LIKE ?", "%#{location.downcase}%").all if location
    @results = @results.where("start_ad_bc = '#{era}'").all if era
    @results = @results.where("lower(setting_location) LIKE ?", "%#{location.downcase}%").all if location

    if (era == 'BCE')
      @results = @results.where("set_start_year = #{set_start_year}").all if set_start_year
    else
      @results = @results.where("set_start_year >= ?", set_start_year).where("set_end_year <= ?", set_start_year).all if set_start_year
    end

    # CODE THAT RETURNS FILMS IN A SPECIFIC RANGE - HERE COMES THE CHEESE
    end_date_films = []
    start_date_films = []
    if (era == 'BCE')
      start_date_films = @results.where("set_start_year <= ?", start_date).where("set_start_year >= ?", end_date).all if (start_date && end_date)
      end_date_films = @results.where("set_end_year <= ?", start_date).where("set_end_year >= ?", end_date).all if (start_date && end_date)
    else
      start_date_films = @results.where("set_start_year >= ?", start_date).where("set_start_year <= ?", end_date).all if (start_date && end_date)
      end_date_films = @results.where("set_end_year >= ?", start_date).where("set_end_year <= ?", end_date).all if (start_date && end_date)
    end
    if (start_date_films.length > 0 || end_date_films.length > 0)
      @results = end_date_films + start_date_films
    end
    # END OF CODE

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
      if (film.start_ad_bc == 'BCE')
        bcArray << film
      elsif (film.start_ad_bc == 'CE')
        adArray << film
      end
    end

    adArray = adArray.sort { |a,b| a.set_start_year.to_i <=> b.set_start_year.to_i }
    bcArray = bcArray.sort { |a,b| b.set_start_year.to_i <=> a.set_start_year.to_i }
    if (bcArray.length > 0 || adArray.length > 0)
      @results = bcArray + adArray
    end
    # END OF CODE

    render json: @results

  end
end
