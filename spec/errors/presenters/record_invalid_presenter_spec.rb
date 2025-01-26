# frozen_string_literal: true

RSpec.describe Presenters::RecordInvalidPresenter do
  subject(:presented) { described_class.new.(error) }

  let(:model_class) do
    Class.new do
      include ActiveModel::Model

      attr_reader :field

      validates :field, presence: true
    end
  end
  let(:record) { model_class.new }
  let(:error) { ActiveRecord::RecordInvalid.new(record) }

  before do
    stub_const('SampleModel', model_class)
    record.validate
  end

  it 'returns the array of errors' do
    expect(presented).to eq(
      [
        {
          title: "can't be blank",
          code: ErrorCodes::INVALID_INPUT,
          status: 422,
          source: { pointer: '/sample_model/field' }
        }
      ]
    )
  end
end
