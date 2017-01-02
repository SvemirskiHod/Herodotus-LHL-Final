class Movie < ApplicationRecord
  has_many :notes
  has_many :comments
  has_many :users
end
