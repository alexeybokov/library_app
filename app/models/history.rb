class History
  include Mongoid::Document

  field :taken_in,    type: Time
  field :returned_in, type: Time
  field :user_id,     type: String

  belongs_to  :user
  belongs_to  :book
end
