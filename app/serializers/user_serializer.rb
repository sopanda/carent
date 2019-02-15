# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :phone_number, :role, :photo

  def photo
    object.photo.service_url.split('?').first if object.photo.attached?
  end
end
