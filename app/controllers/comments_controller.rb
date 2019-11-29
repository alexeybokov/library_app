class CommentsController < ApplicationController
  before_action :find_book

  def index
    @comments = Comment.order(created_at: :desc).page(params[:page])
  end

  def new
    @comment = @book.comments.new
  end

  def create
    @book.comments.create(comment_params).merge(user: current_user)
  end

  private

  def find_book
    @book = Book.find(params[:book_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :book_id)
  end
end
