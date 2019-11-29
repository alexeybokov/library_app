class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body, type: String

  belongs_to  :user
  belongs_to  :book

  validates :body, presence: true

  paginates_per 5
end
