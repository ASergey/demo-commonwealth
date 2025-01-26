# frozen_string_literal: true

module SwaggerSchemas
  AUTHOR = {
    type: 'object',
    properties: {
      id: { type: 'integer' },
      firstname: { type: 'string' },
      lastname: { type: 'string' },
      created_at: { type: 'string', format: 'date-time' },
      updated_at: { type: 'string', format: 'date-time' }
    },
    required: %w[id firstname lastname created_at updated_at]
  }.freeze
end
