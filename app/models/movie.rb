class Movie < ApplicationRecord
  has_many :notes
  has_many :comments

  belongs_to :users
end
