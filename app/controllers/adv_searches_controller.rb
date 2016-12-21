class AdvSearchesController < ApplicationController

  def index  # Will handle advanced searches

    title = params["title"] if params["title"]
    genre = params["genre"] if params["genre"]
    user_submitted_keywords = params["keywords"].split if params["keywords"]
    released = params["date"] if params["date"]


    @results = Movie.all
    @results = @results.where("lower(title) LIKE ?", "%#{title.downcase}%").all if title != ""
    @results = @results.where("lower(genre) LIKE ?", "%#{genre.downcase}%").all if genre != ""
    @results = @results.where("lower(released) LIKE ?", "%#{released.downcase}%").all if released != ""

    movies = []

    @results.each do |film|
      keywords = JSON.parse(film["keywords"])
      puts keywords.class
      puts user_submitted_keywords.class
      user_submitted_keywords.each do |keyword|
        if keywords.include?(keyword)
            movies << film
        end
      end
      # if keywords.include?(user_submitted_keywords)
      #   movies << film
      # end
    end

    render json: movies
  end

end
