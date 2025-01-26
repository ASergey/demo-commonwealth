# frozen_string_literal: true

class CoursesController < ApplicationController
  def index
    courses = Course.includes(:skills, :author).order(:title)

    render json: courses.as_json(include: %i[skills author])
  end

  def show
    render json: course.as_json(include: %i[skills author])
  end

  def create
    input = validate_input.(Courses::CreateInput, request.POST)
    course = create_course.(input[:course])

    render json: course.as_json(include: %i[skills author]), status: :created, location: course
  end

  def update
    input = validate_input.(Courses::UpdateInput, request.POST)
    update_course.(course, input[:course])

    render json: course.as_json(include: %i[skills author])
  end

  def destroy
    course.destroy!

    render status: :no_content
  end

  private

  def course = @course ||= Course.find(params.expect(:id))
  def validate_input = ValidateInput.new

  def create_course = DC.('actions.courses.create')
  def update_course = DC.('actions.courses.update')
end
