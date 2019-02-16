# frozen_string_literal: true

module Users
  class VerificationsController < ApplicationController
    before_action :authenticate_user

    def create
      return render_text_error('document param empty!') if params[:document].nil?
      current_user.verify_document.attach(params[:document])
      current_user.save # for validation
      return render_error(current_user) if current_user.errors.present?
      render_200(current_user)
    end

    def verify
      if user.unverified?
        render_200(msg: user.verify!)
      else
        render_text_error('user already verified!')
      end
    end

    def reject
      if user.verified?
        user.unverify!
        user.verify_document.purge
        render_200(msg: !user.verify_document.attached?)
      else
        render_text_error('user already unverified!')
      end
    end

    private

    def user
      @user ||= User.find(params[:user_id])
    end
  end
end
