require 'rails_helper'

RSpec.describe ParserService do
  context "#html" do
    it 'returns a correct html' do
      html = ParserService.new('This is **bongos**, indeed.').html
      expect(html).to eql("<p>This is <strong>bongos</strong>, indeed.</p>\n");
    end
  end
  context "#preview" do
    it 'returns a clean string' do
      html = ParserService.new('This is **bongos**, indeed.').preview
      expect(html).to eql("<p>This is bongos, indeed.</p>\n");
    end
  end
end
