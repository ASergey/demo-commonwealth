# frozen_string_literal: true

RSpec.describe Course, type: :model do
  it { is_expected.to have_and_belong_to_many(:skills) }
  it { is_expected.to belong_to(:author).required }
end
