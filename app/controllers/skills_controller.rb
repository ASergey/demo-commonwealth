# frozen_string_literal: true

class SkillsController < ApplicationController
  def index
    skills = Skill.order(:name)

    render json: skills.as_json
  end

  def show
    render json: skill.as_json
  end

  def create
    input = validate_input.(Skills::CreateInput, request.POST)
    skill = create_skill.(input[:skill])

    render json: skill.as_json, status: :created, location: skill
  end

  def update
    input = validate_input.(Skills::UpdateInput, request.POST)
    update_skill.(skill, input[:skill])

    render json: skill.as_json
  end

  def destroy
    skill.destroy!

    render status: :no_content
  end

  private

  def skill = @skill ||= Skill.find(params.expect(:id))
  def validate_input = ValidateInput.new

  def create_skill = DC.('actions.skills.create')
  def update_skill = DC.('actions.skills.update')
end
