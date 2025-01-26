# frozen_string_literal: true

class Skills::CreateAction
  def call(input)
    Skill.create!(input)
  rescue ActiveRecord::RecordNotUnique
    raise RequestError.new(I18n.t('errors.skills.name_taken'), field: 'skill/name')
  end
end
