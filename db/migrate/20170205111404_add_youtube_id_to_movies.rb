class AddYoutubeIdToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :youtube_id, :string
  end
end
