# frozen_string_literal: true

module SwaggerSchemas
  COURSE = {
    type: 'object',
    properties: {
      id: { type: 'integer' },
      author_id: { type: 'integer' },
      title: { type: 'string' },
      description: { type: 'string', nullable: true },
      created_at: { type: 'string', format: 'date-time' },
      updated_at: { type: 'string', format: 'date-time' },
      skills: { type: 'array', items: { '$ref': '#/components/schemas/skill' } },
      author: { '$ref': '#/components/schemas/author' }
    },
    required: %w[id author_id skills title description created_at updated_at]
  }.freeze
end
