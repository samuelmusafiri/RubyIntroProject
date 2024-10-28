require 'httparty'

class OpenLibraryService
  BASE_URL = "https://openlibrary.org/search.json"

  def self.fetch_books(query)
    response = HTTParty.get("#{BASE_URL}?q=#{query}")
    JSON.parse(response.body)["docs"]
  end
end
