# frozen_string_literal: true

module SwaggerSchemas
  SKILL = {
    type: 'object',
    properties: {
      id: { type: 'integer' },
      name: { type: 'string' },
      created_at: { type: 'string', format: 'date-time' },
      updated_at: { type: 'string', format: 'date-time' }
    },
    required: %w[id name created_at updated_at]
  }.freeze
end
