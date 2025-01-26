# frozen_string_literal: true

RSpec.describe RequestError do
  it 'initializes minimal single error', :aggregate_failures do
    err = described_class.new('Title')
    expect(err.title).to eq 'Title'
    expect(err.status).to eq RequestError::HTTP_STATUS
    expect(err.code).to eq ErrorCodes::INVALID
    expect(err.field).to be_nil
  end

  it 'initializes full single error', :aggregate_failures do
    err = described_class.new('Title', code: ErrorCodes::RECORD_INVALID, field: 'email')
    expect(err.title).to eq 'Title'
    expect(err.status).to eq RequestError::HTTP_STATUS
    expect(err.code).to eq ErrorCodes::RECORD_INVALID
    expect(err.field).to eq 'email'
  end

  it 'takes message, code and field in account when comparing objects', :aggregate_failures do
    err1 = described_class.new('Foo', code: ErrorCodes::INVALID)
    err2 = described_class.new('Foo', code: ErrorCodes::RECORD_INVALID)
    err3 = described_class.new('Foo', code: ErrorCodes::INVALID, field: 'email')
    err4 = described_class.new('Foo', code: ErrorCodes::RECORD_INVALID, field: 'email')
    err5 = described_class.new('Foo', code: ErrorCodes::RECORD_INVALID, field: 'email')
    err6 = described_class.new('Bar', code: ErrorCodes::RECORD_INVALID, field: 'email')

    expect(err1).not_to eq err2
    expect(err1).not_to eq err3
    expect(err3).not_to eq err4
    expect(err5).not_to eq err6
    expect(err4).to eq err5
  end
end
