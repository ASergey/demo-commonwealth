# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Skill', type: :request do
  path '/skills/{id}' do
    get 'Show skill' do
      tags 'Skill'
      operationId 'showSkill'

      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: 'string'

      include_context 'with example response'

      let(:skill) { create(:skill) }
      let(:id) { skill.id }

      response '200', 'Shown' do
        run_test!

        schema('$ref': '#/components/schemas/skill')
      end

      response '404', 'Skill not found' do
        let(:id) { 'missing_id' }

        run_test!
      end
    end
  end
end
