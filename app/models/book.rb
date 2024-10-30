class Book < ApplicationRecord
  belongs_to :author
  validates :title, :published_date, uniqueness: true, presence: true 
  #Presence ensures the title is not empty
  #Uniqueness prevent duplication
  validates :published_year, numericality: { only_integer: true, less_than_or_equal_to: Time.now.year } 
  #Ensures the publication date is a valid interger
end

