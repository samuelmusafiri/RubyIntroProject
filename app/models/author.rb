class Author < ApplicationRecord
    has_many :books, dependent: :destroy
    validates :name, presence: true 
    #Presence ensures that authors name is present 
    validates :biography, length: { maximum: 500 } #Limitation on characters to avoid long text
  end
  