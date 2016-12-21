class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.string :rated
      t.string :released
      t.string :runtime
      t.string :genre
      t.string :director
      t.string :writer
      t.string :actors
      t.text :plot
      t.string :language
      t.string :country
      t.string :awards
      t.string :poster
      t.integer :metascore
      t.integer :imdbrating
      t.string :imdbid
      t.text :keywords
      t.string :set_start_year
      t.string :start_ad_bc
      t.string :set_start_year_accurate
      t.string :set_end_year
      t.string :end_ad_bc
      t.string :set_end_year_accurate
      t.string :setting_location
      t.timestamps
    end
  end
end
