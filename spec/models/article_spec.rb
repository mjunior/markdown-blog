require 'rails_helper'

RSpec.describe Article, type: :model do
  context "validations" do
    [:title,:body].each do |field|
      it { should validate_presence_of(field) }
    end
  end
end