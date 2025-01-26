# frozen_string_literal: true

require_relative 'auto_inject/actions'
require_relative 'auto_inject/services'
require_relative 'auto_inject/queries'

class DryContainer
  extend Dry::Container::Mixin

  extend AutoInjectActions
  extend AutoInjectServices
  extend AutoInjectQueries
end

DI = Dry::AutoInject(DryContainer)
DC = ->(key) { DryContainer.resolve(key) }
