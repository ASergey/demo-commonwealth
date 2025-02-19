# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :courses, dependent: :restrict_with_exception
end
