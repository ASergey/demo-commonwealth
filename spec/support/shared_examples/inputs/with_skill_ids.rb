# frozen_string_literal: true

RSpec.shared_examples_for 'with skill_ids' do
  subject(:validate_input) { contract.(input) }

  let(:contract) { described_class.new }

  context 'with skill_ids' do
    let(:skill_ids) { [123, '321'] }

    let(:input) do
      {
        course: { skill_ids:, title: 'sample title', author_id: 23 }
      }
    end

    it 'passes validation' do
      expect(validate_input.errors).to be_empty
    end

    context 'when skill_ids has invalid value' do
      let(:skill_ids) { [-9] }

      it 'fails skill_ids validation' do
        expect(validate_input.errors[:course][:skill_ids][0]).to include 'must be greater than 0'
      end
    end

    context 'when skill_ids field is not an array' do
      let(:input) do
        {
          course: { skill_ids: '123' }
        }
      end

      it 'fails skill_ids validation' do
        expect(validate_input.errors[:course][:skill_ids]).to include 'must be an array'
      end
    end
  end
end
