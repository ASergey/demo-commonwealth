# frozen_string_literal: true

RSpec.describe Authors::MatchingByCourseSkillsQuery do
  subject(:matching_authors) { described_class.new.(course) }

  let(:skill) { create(:skill, name: 'Особенный навык 1') }
  let(:skills) { [skill, create(:skill)] }
  let(:old_author) { create(:author) }
  let(:course) { create(:course, author: old_author, skills:) }

  let!(:course1) { create(:course, skills: [skill, create(:skill)]) }

  it 'returns authors having courses with matching skills' do
    expect(matching_authors).to contain_exactly(course1.author)
  end

  context 'with no matching skills' do
    let(:skills) { [create(:skill)] }

    it 'does not return matching author' do
      expect(matching_authors).to be_empty
    end
  end

  # rubocop:disable RSpec/LetSetup
  context 'when all courses has the same author' do
    let!(:course1) { create(:course, skills: [skill], author: old_author) }

    it 'does not return matching author' do
      expect(matching_authors).to be_empty
    end
  end
  # rubocop:enable RSpec/LetSetup
end
