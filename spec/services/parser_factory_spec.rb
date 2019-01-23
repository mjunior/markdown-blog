require 'rails_helper'

RSpec.describe ParserFactory do
  context "When type is HTML" do
    it 'returns a correct html' do
      factory = ParserFactory.for('HTML')
      expect(factory.instance_variable_get(:@renderer).class.to_s).to eql("Redcarpet::Render::Safe");
    end
  end

  context "When type is STRING" do
    it 'returns a clean string' do
      factory = ParserFactory.for('STRING')
      expect(factory.instance_variable_get(:@renderer).class.to_s).to eql("Redcarpet::Render::StripDown");
    end
  end

  context "When type doesnt exist" do
    it 'raise a exception' do
      expect { ParserFactory.for('NIL')  }.to raise_error(RuntimeError, 'Unsupported type of render')
    end
  end
end

