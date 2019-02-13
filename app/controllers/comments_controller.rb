class CommentsController < ApplicationController
  before_action :find_book

  def index
    @comments = Comment.order(created_at: :desc).page(params[:page])
  end

  def new
    @comment = @book.comments.new
  end

  private

  def find_book
    @book = Book.find(params[:book_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :image_id)
  end
end
