# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Skills', type: :request do
  path '/skills' do
    get 'Lists skills' do
      tags 'Skills'
      operationId 'listSkills'

      produces 'application/json'

      include_context 'with example response'

      before do
        create_list(:skill, 3)
      end

      response '200', 'List of skills' do
        run_test!

        schema type: 'array', items: { '$ref': '#/components/schemas/skill' }
      end
    end
  end
end
