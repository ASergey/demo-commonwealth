# frozen_string_literal: true

# :reek:DataClump
module RequestsHelper
  DEFAULT_HEADERS = {
    'CONTENT_TYPE' => 'application/json',
    'ACCEPT' => 'application/json',
    'HTTP_USER_AGENT' => 'rspec'
  }.freeze

  def get(path, options = {}, &)
    super(path, **options.merge(wrap_headers(options)), &)
  end

  def post(path, options = {}, &)
    super(path, **json_data(options), &)
  end

  def patch(path, options = {}, &)
    super(path, **json_data(options), &)
  end

  def delete(path, options = {}, &)
    super(path, **wrap_headers(options), &)
  end

  def body
    @bodies ||= {}.compare_by_identity
    @bodies[response] ||= begin
      json_body = response.body
      json_body.empty? ? {} : JSON.parse(json_body)&.deep_symbolize_keys!
    end
  end

  def field_errors(body)
    body[:errors].map { |error| [error[:source].send(:[], :pointer), error[:title]] }
  end

  private

  def json_data(options)
    wrap_headers(options)
      .merge(params: options.key?(:params) ? wrap_params(options[:params]) : nil)
      .compact
  end

  def wrap_params(params)
    return unless params
    return params if params.is_a?(String)

    params.to_json
  end

  def wrap_headers(options)
    {
      headers: DEFAULT_HEADERS.merge(options[:headers] || {})
    }
  end
end
