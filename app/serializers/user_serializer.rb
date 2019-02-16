# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :phone_number, :role, :photo, :verify_document, :verified

  def photo
    object.photo.service_url.split('?').first if object.photo.attached?
  end

  def verify_document
    object.verify_document.service_url.split('?').first if object.verify_document.attached?
  end

  def verified
    object.aasm_state == 'verified' ? true : false
  end
end
