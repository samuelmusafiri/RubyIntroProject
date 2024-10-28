class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def search
    query = params[:query]
    @authors = Author.where("name LIKE ?", "%#{query}%")
    render :index
  end
end

