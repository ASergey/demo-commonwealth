# frozen_string_literal: true

class Authors::MatchingByCourseSkillsQuery
  def call(course)
    Author.joins(courses: :skills)
          .where(courses_skills: { skill_id: course.skill_ids })
          .where.not(id: course.author_id)
  end
end
