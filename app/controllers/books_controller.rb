class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def search
    query = params[:query]
    @books = Book.where("title LIKE ?", "%#{query}%")
    render :index
  end
end

