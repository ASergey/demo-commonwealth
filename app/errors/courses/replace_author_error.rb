# frozen_string_literal: true

class Courses::ReplaceAuthorError < StandardError
  def initialize
    super(I18n.t('errors.courses.no_one_for_replacement'))
  end
end
