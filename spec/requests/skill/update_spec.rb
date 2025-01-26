# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Skill', type: :request do
  path '/skills/{id}' do
    patch 'Update skill' do
      tags 'Skill'
      operationId 'updateSkill'

      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: 'string'

      include_context 'with example response'

      parameter name: :params, in: :body, schema: {
        type: 'object',
        properties: {
          skill: {
            type: 'object',
            properties: {
              name: { type: 'string' }
            },
            required: %w[name]
          }
        },
        required: %w[skill]
      }

      let(:skill) { create(:skill) }
      let(:id) { skill.id }
      let(:params) { { skill: { name: 'Финансы' } } }

      response '200', 'Skill updated' do
        run_test!

        schema('$ref': '#/components/schemas/skill')
      end

      response '404', 'Skill not found' do
        let(:id) { 'missing_id' }

        run_test!
      end

      response '400', 'Invalid input' do
        let(:params) { { skill: { name: '' } } }

        run_test!
      end
    end
  end
end
