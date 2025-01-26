# frozen_string_literal: true

FactoryBot.define do
  factory :skill do
    sequence(:name) { |n| "Навык #{n}" }
  end
end
