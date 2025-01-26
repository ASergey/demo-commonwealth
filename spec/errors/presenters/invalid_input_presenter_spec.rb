# frozen_string_literal: true

RSpec.describe Presenters::InvalidInputPresenter do
  subject(:presented) { described_class.new.(error) }

  let(:error) { InvalidInput.new(message, result:) }
  let(:message) { 'message' }
  let(:result) { instance_double(InvalidInput, errors:) }

  let(:errors) { { field1: %w[error1 error2], author: { field2: %w[error3] } } }

  it 'returns the array of errors' do
    expect(presented).to eq(
      [
        {
          title: 'error1',
          code: ErrorCodes::INVALID_INPUT,
          status: 422,
          source: { pointer: '/field1' }
        },
        {
          title: 'error2',
          code: ErrorCodes::INVALID_INPUT,
          status: 422,
          source: { pointer: '/field1' }
        },
        {
          title: 'error3',
          code: ErrorCodes::INVALID_INPUT,
          status: 422,
          source: { pointer: '/author/field2' }
        }
      ]
    )
  end

  it 'raises unknown data type error' do
    expect do
      error = instance_double(InvalidInput, errors: 'abc')
      described_class.new.(error)
    end.to raise_error 'Unknown data type'
  end
end
