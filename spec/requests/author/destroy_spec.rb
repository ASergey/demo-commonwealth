# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Author', type: :request do
  path '/authors/{id}' do
    delete 'Destroy author' do
      tags 'Author'
      operationId 'destroyAuthor'

      consumes 'application/json'

      parameter name: :id, in: :path, type: 'string'

      let!(:author) { create(:author) }
      let(:id) { author.id }

      response '204', 'Author destroyed' do
        run_test!
      end

      response '404', 'Author not found' do
        let(:id) { 'missing_id' }

        run_test!
      end
    end
  end
end
