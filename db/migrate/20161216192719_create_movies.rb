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
      t.text :summary_text
      t.timestamps
    end
  end
end
