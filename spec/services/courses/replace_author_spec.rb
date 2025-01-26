# frozen_string_literal: true

RSpec.describe Courses::ReplaceAuthor do
  subject(:replace_author) { described_class.new(matching_authors:).(course) }

  let(:course) { create(:course) }
  let(:matching_authors) { instance_double(Authors::MatchingByCourseSkillsQuery, call: matched_authors) }

  let(:matched_authors) { [author] }
  let(:author) { create(:author) }

  it 'replaces course author with other matching one' do
    expect { replace_author }.to change(course, :author).to(author)
  end

  context 'when there are no matched authors' do
    let(:matched_authors) { [] }
    let!(:random_author) { create(:author) }

    it 'replaces course author with other random one' do
      expect { replace_author }.to change(course, :author).to(random_author)
    end
  end

  context 'when there are no authors for replace' do
    let(:matched_authors) { [] }

    it 'raises exception' do
      expect { replace_author }.to raise_error(
        Courses::ReplaceAuthorError,
        'There are no other authors for replacement'
      )
    end
  end
end
