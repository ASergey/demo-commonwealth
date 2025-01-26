# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Courses', type: :request do
  path '/courses' do
    post 'Add course' do
      tags 'Courses'
      operationId 'createCourse'

      consumes 'application/json'
      produces 'application/json'

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
              author_id: { type: 'string' }
            },
            required: %w[title skill_ids author_id]
          }
        },
        required: %w[course]
      }

      let(:params) do
        {
          course: {
            title: 'Финансовая грамотность',
            author_id: create(:author).id,
            skill_ids: create_list(:skill, 2).pluck(:id)
          }
        }
      end

      response '201', 'Course created' do
        run_test!

        schema('$ref': '#/components/schemas/course')
      end

      response '400', 'Invalid input' do
        let(:params) { { course: { title: '' } } }

        run_test!
      end

      response '422', 'Already exists' do
        let(:existing_course) { create(:course) }
        let(:params) do
          {
            course: {
              title: existing_course.title,
              author_id: create(:author).id,
              skill_ids: create_list(:skill, 2).pluck(:id)
            }
          }
        end

        run_test!
      end
    end
  end
end
