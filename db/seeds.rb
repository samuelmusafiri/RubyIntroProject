# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

books_data = OpenLibraryService.fetch_books("ruby programming")

books_data.each do |book_data|
  author_name = book_data["author_name"]&.first || "Unknown Author"
  author = Author.find_or_create_by(name: author_name)

  Book.create(
    title: book_data["title"],
    description: book_data["first_sentence"] || "No description available.",
    published_date: book_data["publish_date"]&.first || "Unknown",
    cover_image: book_data["cover_i"] ? "https://covers.openlibrary.org/b/id/#{book_data['cover_i']}-L.jpg" : "",
    author: author
  )
end

