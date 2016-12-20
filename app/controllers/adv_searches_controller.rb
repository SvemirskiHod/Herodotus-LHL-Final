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


# PLEASE DO NOT TOUCH
    # def return_flat_array(parsed_array)
    #   flat_array = []
    #   parsed_array.each do |phrase|
    #     if phrase.split.length == 1
    #       flat_array << phrase
    #     else
    #       phrase.split.each do |word|
    #        flat_array << word
    #       end
    #     end
    #   end
    #   return flat_array
    # end

    #   results = @results

    # @results.each do |film|
    #   flat_array = return_flat_array(JSON.parse(film.keywords))
    #   if flat_array & user_submitted_keywords == []
    #     results = results.destroy[film]
    #   end
    # end
# PLEASE DO NOT TOUCH



    user_submitted_keywords.each do |keyword|
      @results = @results.where("lower(keywords) LIKE ?", "%#{keyword.downcase}%").all if keyword != ""
    end







    render json: @results
  end


end
