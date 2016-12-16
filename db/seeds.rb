# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require ('json')

file = File.open('db/api_movie_call.json', "r")

# initial_seeds = ActiveSupport::JSON.decode(File.read('./api_movie_call.json'))
initial_seeds = JSON.parse(file.read)

Movie.destroy_all

initial_seeds["data"].each do |movie|
  # byebug
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
    keywords: movie["keywords"],
    summary_text: movie["summary_text"]}
  )
  # puts movie["Runtime"]
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