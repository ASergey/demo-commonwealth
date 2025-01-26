# frozen_string_literal: true

RSpec.describe Authors::UpdateInput do
  subject { contract.(input) }

  let(:contract) { described_class.new }

  it_behaves_like 'with string attributes', :author, %i[firstname lastname]
  it_behaves_like 'with required attributes', :author, %i[firstname lastname]
end
