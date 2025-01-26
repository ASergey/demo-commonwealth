# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Course', type: :request do
  path '/courses/{id}' do
    patch 'Update course' do
      tags 'Course'
      operationId 'updateCourse'

      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: 'string'

      include_context 'with example response'

      parameter name: :params, in: :body, schema: {
        type: 'object',
        properties: {
          course: {
            type: 'object',
            properties: {
              title: { type: 'string' },
              description: { type: 'string', nullable: true },
              skill_ids: { type: 'array', items: { type: 'integer' } },
              author_id: { type: 'integer' }
            },
            required: %w[title skill_ids author_id]
          }
        },
        required: %w[course]
      }

      let(:course) { create(:course, skills: create_list(:skill, 2)) }
      let(:id) { course.id }
      let(:new_skill_ids) { create_list(:skill, 1).pluck(:id) }
      let(:params) { { course: { title: 'Финансовая грамотность', skill_ids: new_skill_ids } } }

      response '200', 'Course updated' do
        run_test!

        schema('$ref': '#/components/schemas/course')
      end

      response '404', 'Course not found' do
        let(:id) { 'missing_id' }

        run_test!
      end

      response '400', 'Invalid input' do
        let(:params) { { course: { title: '' } } }

        run_test!
      end
    end
  end
end
