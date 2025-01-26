# frozen_string_literal: true

class Courses::ReplaceAuthor
  include DI[matching_authors: 'queries.authors.matching_by_course_skills']

  def call(course)
    author = matching_author(course) || random_author(course.author)
    raise Courses::ReplaceAuthorError unless author

    course.update!(author:)
  end

  private

  def matching_author(course) = matching_authors.(course).first
  def random_author(author)= Author.where.not(id: author.id).order('RANDOM()').limit(1).take
end
