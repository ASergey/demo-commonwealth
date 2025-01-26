# frozen_string_literal: true

# Allows to automatically inject dependencies to object constructors from a
# configured container.
# http://dry-rb.org/gems/dry-auto_inject/
module AutoInjectActions
  def self.extended(container)
    container.instance_exec do
      namespace :actions do
        namespace :authors do
          register(:create) { Authors::CreateAction.new }
          register(:update) { Authors::UpdateAction.new }
          register(:destroy) { Authors::DestroyAction.new }
        end

        namespace :courses do
          register(:create) { Courses::CreateAction.new }
          register(:update) { Courses::UpdateAction.new }
        end

        namespace :skills do
          register(:create) { Skills::CreateAction.new }
          register(:update) { Skills::UpdateAction.new }
        end
      end
    end
  end
end
