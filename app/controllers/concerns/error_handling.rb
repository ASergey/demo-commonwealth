# frozen_string_literal: true

module ErrorHandling
  extend ActiveSupport::Concern

  included do
    # Invalid input format
    rescue_from InvalidInput do |err|
      presenter = Presenters::InvalidInputPresenter.new
      render json: { errors: presenter.(err) }, status: :bad_request
    end

    # Record is not in the database
    rescue_from ActiveRecord::RecordNotFound do |err|
      presenter = Presenters::RecordNotFoundPresenter.new
      render json: { errors: presenter.(err) }, status: :not_found
    end

    # Record has errors
    rescue_from ActiveRecord::RecordInvalid do |err|
      render json: { error: err.record.errors.messages }, status: :unprocessable_entity
    end

    # General request error
    rescue_from RequestError do |err|
      presenter = Presenters::RequestErrorPresenter.new
      render json: { errors: presenter.(err) }, status: err.status
    end
  end
end
