# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Authors', type: :request do
  path '/authors' do
    post 'Add author' do
      tags 'Authors'
      operationId 'createAuthor'

      consumes 'application/json'
      produces 'application/json'

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

      let(:params) { { author: { firstname: 'Алексей', lastname: 'Алексеев' } } }

      response '201', 'Author created' do
        run_test!

        schema('$ref': '#/components/schemas/author')
      end

      response '400', 'Invalid input' do
        let(:params) { { author: { lastname: '' } } }

        run_test!
      end
    end
  end
end
