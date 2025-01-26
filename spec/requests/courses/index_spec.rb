# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Courses', type: :request do
  path '/courses' do
    get 'Lists courses' do
      tags 'Courses'
      operationId 'listCourses'

      produces 'application/json'

      include_context 'with example response'

      before do
        create_list(:course, 3, skills: [create(:skill)])
      end

      response '200', 'List of courses' do
        run_test!

        schema type: 'array', items: { '$ref': '#/components/schemas/course' }
      end
    end
  end
end
