# frozen_string_literal: true

RSpec.describe Courses::UpdateInput do
  it_behaves_like 'with string attributes', :course, %i[title description]
  it_behaves_like 'with integer attributes', :course, %i[author_id]
  include_examples 'with skill_ids'
end
