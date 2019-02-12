class BooksController < ApplicationController
  # respond_to :html, :js
  before_action :find_book

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
  end

  def edit; end

  def show
  end

  def take
    @book.history.create
    @book.update(status: false)
  end

  def like

  end


  private

  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:cover, :title, :author, :description)
  end
end
