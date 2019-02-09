module Users
  class ReviewSerializer < ActiveModel::Serializer
    attributes :id, :text, :rating, :user, :author

    belongs_to :author
    belongs_to :user
  end
end
