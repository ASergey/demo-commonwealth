# frozen_string_literal: true

class Courses::UpdateAction
  def call(course, input)
    course.update!(input)
  rescue ActiveRecord::RecordNotUnique
    raise RequestError.new(I18n.t('errors.courses.title_taken'), field: 'course/title')
  end
end
