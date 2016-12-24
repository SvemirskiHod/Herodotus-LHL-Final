class AdvSearchesController < ApplicationController

  def index  # Will handle advanced searches
    puts params

    title = params["title"] if params["title"]
    genre = params["genre"] if params["genre"]
    user_submitted_keywords = params["keywords"].split.map!(&:downcase) if params["keywords"]
    set_start_year = params["date"] if params["date"]
    location = params["location"]
    era = params["era"]



    @results = Movie.all
    @results = @results.where("lower(title) LIKE ?", "%#{title.downcase}%").all if title != ""
    @results = @results.where("lower(genre) LIKE ?", "%#{genre.downcase}%").all if genre != ""
    @results = @results.where("set_start_year = #{set_start_year}").all if set_start_year != ""
    @results = @results.where("start_ad_bc = '#{era}'").all if era != ""
    @results = @results.where("lower(setting_location) LIKE ?", "%#{location.downcase}%").all if location != ""
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
