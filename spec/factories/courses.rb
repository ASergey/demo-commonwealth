# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    sequence(:title) { |n| "Курс #{n}" }
    author
  end
end
