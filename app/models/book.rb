class Book < ApplicationRecord
  belongs_to :author
  validates :title, :published_date, presence: true
end

