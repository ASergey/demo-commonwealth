# frozen_string_literal: true

class AuthorsController < ApplicationController
  def index
    authors = Author.order(:firstname)

    render json: authors.as_json
  end

  def show
    render json: author.as_json
  end

  def create
    input = validate_input.(Authors::CreateInput, request.POST)
    author = create_author.(input[:author])

    render json: author.as_json, status: :created, location: author
  end

  def update
    input = validate_input.(Authors::UpdateInput, request.POST)
    update_author.(author, input[:author])

    render json: author.as_json
  end

  def destroy
    destroy_author.(author)

    render status: :no_content
  end

  private

  def author = @author ||= Author.find(params.expect(:id))
  def validate_input = ValidateInput.new

  def create_author = DC.('actions.authors.create')
  def update_author = DC.('actions.authors.update')
  def destroy_author = DC.('actions.authors.destroy')
end
