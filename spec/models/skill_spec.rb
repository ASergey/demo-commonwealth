# frozen_string_literal: true

RSpec.describe Skill, type: :model do
  it { is_expected.to have_and_belong_to_many(:courses) }
end
