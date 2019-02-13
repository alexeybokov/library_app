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
    @comments = Comment.order(created_at: :desc).page(params[:page]).per(5)
  end

  def take
    @book.history.create!(user: current_user, taken_in: Time.now)
    @book.update(status: false)
  end

  def return
    @history = @book.history.where(user: current_user, returned_in: nil)
    @history.update(returned_in: Time.now)
    @book.update(status: true)
  end

  def like; end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:cover, :title, :author, :description)
  end
end
