# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Author', type: :request do
  path '/authors/{id}' do
    get 'Show author' do
      tags 'Author'
      operationId 'showAuthor'

      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: 'string'

      include_context 'with example response'

      let(:author) { create(:author) }
      let(:id) { author.id }

      response '200', 'Shown' do
        run_test!

        schema('$ref': '#/components/schemas/author')
      end

      response '404', 'Author not found' do
        let(:id) { 'missing_id' }

        run_test!
      end
    end
  end
end
