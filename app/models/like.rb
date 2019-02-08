class Like
  include Mongoid::Document

  field :rating, type: Integer, default: 0


  belongs_to  :user
  belongs_to  :book

  validates :rating, presence: true
end
