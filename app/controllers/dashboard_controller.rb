class DashboardController < ApplicationController
  def index
    @books = Book.order_by(created_at: :desc)
    @top_books = Book.order_by(created_at: :desc).limit(5)
  end

  def newest
    @books = Book.order_by(created_at: :desc).limit(5)
    render action: :index
  end
end
