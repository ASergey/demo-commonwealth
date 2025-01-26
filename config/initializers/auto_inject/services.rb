# frozen_string_literal: true

# Allows to automatically inject dependencies to object constructors from a
# configured container.
# http://dry-rb.org/gems/dry-auto_inject/
module AutoInjectServices
  def self.extended(container)
    container.instance_exec do
      namespace :services do
        namespace :courses do
          register(:replace_author) { Courses::ReplaceAuthor.new }
        end
      end
    end
  end
end
