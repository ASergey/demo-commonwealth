# frozen_string_literal: true

RSpec.describe Presenters::RequestErrorPresenter do
  subject(:presented) { described_class.new.(error) }

  let(:message) { 'Invalid name' }

  context 'with full info' do
    let(:error) { RequestError.new(message, code: ErrorCodes::RECORD_INVALID, field: 'name') }

    it 'returns the array of errors' do
      expect(presented).to eq(
        [
          {
            title: message,
            status: RequestError::HTTP_STATUS,
            code: ErrorCodes::RECORD_INVALID,
            source: { pointer: '/name' }
          }
        ]
      )
    end
  end

  context 'with minimum info' do
    let(:error) { RequestError.new(message) }

    it 'returns the array of errors' do
      expect(presented).to eq(
        [
          {
            title: message,
            status: RequestError::HTTP_STATUS,
            code: ErrorCodes::INVALID,
            source: nil
          }
        ]
      )
    end
  end
end
