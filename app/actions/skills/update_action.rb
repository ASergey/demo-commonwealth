# frozen_string_literal: true

class Skills::UpdateAction
  def call(skill, input)
    skill.update!(input)
  rescue ActiveRecord::RecordNotUnique
    raise RequestError.new(I18n.t('errors.skills.name_taken'), field: 'skill/name')
  end
end
