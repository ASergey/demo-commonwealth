# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ErrorHandling

  before_action :set_default_format

  def set_default_format
    request.format = :json
  end
end
