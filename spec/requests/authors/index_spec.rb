# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Authors', type: :request do
  path '/authors' do
    get 'Lists authors' do
      tags 'Authors'
      operationId 'listAuthors'

      produces 'application/json'

      include_context 'with example response'

      before do
        create_list(:author, 3)
      end

      response '200', 'List of authors' do
        run_test!

        schema type: 'array', items: { '$ref': '#/components/schemas/author' }
      end
    end
  end
end
