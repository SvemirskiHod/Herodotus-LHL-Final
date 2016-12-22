class AdvSearchesController < ApplicationController

  def index  # Will handle advanced searches

    title = params["title"] if params["title"]
    genre = params["genre"] if params["genre"]
    user_submitted_keywords = params["keywords"].split.map!(&:downcase) if params["keywords"]
    released = params["date"] if params["date"]


    @results = Movie.all
    @results = @results.where("lower(title) LIKE ?", "%#{title.downcase}%").all if title != ""
    @results = @results.where("lower(genre) LIKE ?", "%#{genre.downcase}%").all if genre != ""
    @results = @results.where("lower(released) LIKE ?", "%#{released.downcase}%").all if released != ""

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
