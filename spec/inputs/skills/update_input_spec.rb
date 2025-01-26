# frozen_string_literal: true

RSpec.describe Skills::UpdateInput do
  subject { contract.(input) }

  let(:contract) { described_class.new }

  it_behaves_like 'with string attributes', :skill, %i[name]
  it_behaves_like 'with required attributes', :skill, %i[name]
end
