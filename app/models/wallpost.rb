class Wallpost
  include Mongoid::Document

  belongs_to :user

  field :created, type: DateTime
  field :created_by, type: BSON::ObjectId
  field :post_comment, type: String
  
end
