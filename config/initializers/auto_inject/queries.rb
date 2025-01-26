# frozen_string_literal: true

# Allows to automatically inject dependencies to object constructors from a
# configured container.
# http://dry-rb.org/gems/dry-auto_inject/
module AutoInjectQueries
  def self.extended(container)
    container.instance_exec do
      namespace :queries do
        namespace :authors do
          register(:matching_by_course_skills) { Authors::MatchingByCourseSkillsQuery.new }
        end
      end
    end
  end
end
