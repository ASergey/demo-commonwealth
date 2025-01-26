# frozen_string_literal: true

# :reek:FeatureEnvy
class Presenters::RequestErrorPresenter
  def call(error)
    [
      {
        title: error.title,
        code: error.code,
        status: error.status,
        source: source(error.field)
      }
    ]
  end

  private

  def source(field)
    return nil unless field

    { pointer: "/#{field}" }
  end
end
