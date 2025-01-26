# frozen_string_literal: true

RSpec.describe Presenters::RecordNotFoundPresenter do
  subject(:presented) { described_class.new.(error) }

  let(:error) { ActiveRecord::RecordNotFound.new(message, model: Author.new) }
  let(:message) { 'Author not found' }

  it 'returns the array of errors' do
    expect(presented).to eq(
      [
        {
          title: message,
          status: 404,
          code: ErrorCodes::NOT_FOUND
        }
      ]
    )
  end
end
