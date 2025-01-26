# frozen_string_literal: true

RSpec.describe Authors::DestroyAction do
  subject(:destroy_author) { described_class.new.(author) }

  let!(:author) { create(:author) }
  let!(:new_author) { create(:author) }
  let!(:author_courses) { create_list(:course, 2, author:) }

  it 'destroys the author with making replacements for all courses', :aggregate_failures do
    expect { destroy_author }.to change(Author, :count).from(2).to(1)
    expect(Author).not_to exist(author.id)
    expect(author_courses.map(&:reload).pluck(:author_id).uniq).to contain_exactly(new_author.id)
  end

  context 'when there are no courses by the author' do
    let(:author_courses) { [] }

    it 'destroys the author', :aggregate_failures do
      expect { destroy_author }.to change(Author, :count).from(2).to(1)
      expect(Author).not_to exist(author.id)
    end
  end

  context 'when there is no replacement author' do
    let(:new_author) { nil }

    it 'raises RequestError' do
      expect { destroy_author }.to raise_error(
        RequestError,
        'Could not destroy author due to reason: There are no other authors for replacement'
      )
    end
  end
end
