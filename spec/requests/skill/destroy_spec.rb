# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Skill', type: :request do
  path '/skills/{id}' do
    delete 'Destroy skill' do
      tags 'Skill'
      operationId 'destroySkill'

      consumes 'application/json'

      parameter name: :id, in: :path, type: 'string'

      let!(:skill) { create(:skill) }
      let(:id) { skill.id }

      response '204', 'Skill destroyed' do
        run_test!
      end

      response '404', 'Skill not found' do
        let(:id) { 'missing_id' }

        run_test!
      end
    end
  end
end
