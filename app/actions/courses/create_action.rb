# frozen_string_literal: true

class Courses::CreateAction
  def call(input)
    Course.create!(input)
  rescue ActiveRecord::RecordNotUnique
    raise RequestError.new(I18n.t('errors.courses.title_taken'), field: 'course/title')
  end
end
