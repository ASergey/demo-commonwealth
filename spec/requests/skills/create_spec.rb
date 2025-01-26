# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Skills', type: :request do
  path '/skills' do
    post 'Add skill' do
      tags 'Skills'
      operationId 'createSkill'

      consumes 'application/json'
      produces 'application/json'

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

      let(:params) { { skill: { name: 'Финансы' } } }

      response '201', 'Skill created' do
        run_test!

        schema('$ref': '#/components/schemas/skill')
      end

      response '400', 'Invalid input' do
        let(:params) { { skill: { name: '' } } }

        run_test!
      end

      response '422', 'Already exists' do
        let(:existing_skill) { create(:skill) }
        let(:params) do
          {
            skill: { name: existing_skill.name }
          }
        end

        run_test!
      end
    end
  end
end
