# frozen_string_literal: true

RSpec.shared_examples_for 'with integer attributes' do |parent, attrs = []|
  parent = Array(parent)

  attrs.each do |attr|
    it "validates #{parent.join('.')}.#{attr} is an integer" do
      params = parent.reverse.inject(attr => 'str') { |o, i| { i => o } }
      res = described_class.new.(params)

      errors = res.errors.to_h
      errors = errors.dig(*parent) unless parent.empty?
      expect(errors[attr]).to eq ['must be an integer']
    end
  end
end
