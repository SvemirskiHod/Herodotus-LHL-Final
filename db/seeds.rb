# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require ('json')

file = File.open('db/api_movie_call.json', "r")
initial_seeds = JSON.parse(file.read)

def return_flat_array(parsed_array)
  flat_array = []
  parsed_array.each do |phrase|
    if phrase.split.length == 1
      flat_array << phrase
    else
      phrase.split.each do |word|
       flat_array << word
      end
    end
  end
  return flat_array
end

Movie.destroy_all

initial_seeds["data"].each do |movie|
  Movie.create!({
    title: movie["Title"],
    year: movie["Year"],
    rated: movie["Rated"],
    released: movie["Released"],
    runtime: movie["Runtime"],
    genre: movie["Genre"],
    director: movie["Director"],
    writer: movie["Writer"],
    actors: movie["Actors"],
    plot: movie["Plot"],
    language: movie["Language"],
    country: movie["Country"],
    awards: movie["Awards"],
    poster: movie["Poster"],
    metascore: movie["Metascore"],
    imdbrating: movie["imdbRating"],
    imdbid: movie["imdbID"],
    keywords: return_flat_array(movie["keywords"]),
    summary_text: movie["summary_text"]}
  )
end

# title
# year
# rated
# released
# runtime
# genre
# director
# writer
# actors
# plot
# language
# country
# awards
# poster
# metascore
# imdbrating
# imdbid
# type
# keywords
# summary_text