# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Course', type: :request do
  path '/courses/{id}' do
    get 'Show course' do
      tags 'Course'
      operationId 'showCourse'

      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: 'string'

      include_context 'with example response'

      let(:course) { create(:course) }
      let(:id) { course.id }

      response '200', 'Shown' do
        run_test!

        schema('$ref': '#/components/schemas/course')
      end

      response '404', 'Course not found' do
        let(:id) { 'missing_id' }

        run_test!
      end
    end
  end
end
