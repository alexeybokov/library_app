class Book
  include Mongoid::Document
  include Mongoid::Timestamps

  mount_uploader :cover,  CoverUploader

  field :title,           type: String
  field :author,          type: String
  field :description,     type: String
  field :cover,           type: String
  field :status,          type: Boolean,  default: true
  field :likes_count,     type: Integer,  default: 0
  field :rating,          type: Float,    default: 0.0

  belongs_to  :user
  has_many    :likes, dependent: :destroy
  has_many    :comments, dependent: :destroy
  has_many    :history, dependent: :destroy

  validates :title,   presence: true
  validates :author,  presence: true
  validates :description, presence: true

  scope :newest, -> { order_by(created_at: :desc).limit(5) }

  def taken_by(user_id)
    history.where(user_id: user_id, return: nil).exists?
  end
end
