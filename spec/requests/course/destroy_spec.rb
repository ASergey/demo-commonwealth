# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Course', type: :request do
  path '/courses/{id}' do
    delete 'Destroy course' do
      tags 'Course'
      operationId 'destroyCourse'

      consumes 'application/json'

      parameter name: :id, in: :path, type: 'string'

      let!(:course) { create(:course) }
      let(:id) { course.id }

      response '204', 'Course destroyed' do
        run_test!
      end

      response '404', 'Course not found' do
        let(:id) { 'missing_id' }

        run_test!
      end
    end
  end
end
