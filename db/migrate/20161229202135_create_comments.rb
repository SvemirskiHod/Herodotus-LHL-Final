class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :user
      t.references :movie
      t.text :comment
    end
  end
end
