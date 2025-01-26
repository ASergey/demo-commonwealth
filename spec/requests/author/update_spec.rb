# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Author', type: :request do
  path '/authors/{id}' do
    patch 'Update author' do
      tags 'Author'
      operationId 'updateAuthor'

      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: 'string'

      include_context 'with example response'

      parameter name: :params, in: :body, schema: {
        type: 'object',
        properties: {
          author: {
            type: 'object',
            properties: {
              firstname: { type: 'string' },
              lastname: { type: 'string' }
            },
            required: %w[firstname lastname]
          }
        },
        required: %w[author]
      }

      let(:author) { create(:author) }
      let(:id) { author.id }
      let(:params) { { author: { firstname: 'Алексей', lastname: 'Алексеев' } } }

      response '200', 'Author updated' do
        run_test!

        schema('$ref': '#/components/schemas/author')
      end

      response '404', 'Author not found' do
        let(:id) { 'missing_id' }

        run_test!
      end

      response '400', 'Invalid input' do
        let(:params) { { author: { lastname: '' } } }

        run_test!
      end
    end
  end
end
