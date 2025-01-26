# frozen_string_literal: true

class Authors::DestroyAction
  include DI['services.courses.replace_author']

  def call(author)
    ActiveRecord::Base.transaction do
      replace_authors_courses(author)
      author.destroy!
    end
  rescue Courses::ReplaceAuthorError => e
    raise RequestError, I18n.t('errors.authors.destroy', reason: e.message)
  end

  private

  def replace_authors_courses(author)
    author.courses.find_each { |course| replace_author.(course) }
  end
end
