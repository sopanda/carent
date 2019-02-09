module Cars
  class ReviewSerializer < ActiveModel::Serializer
    attributes :id, :text, :rating, :car, :author

    belongs_to :author
    belongs_to :car
  end
end
