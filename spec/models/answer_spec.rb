require 'rails_helper'

RSpec.describe Answer, :type => :model do

    it "is invalid without a title" do
      answer = Answer.new(title: nil, content: "Hey")
      result = answer.save
      expect(result).to eq(false)
    end

    it "is invalid without content" do
      answer = Answer.new(title: "Example", content: nil)
      result = answer.save
      expect(result).to eq(false)
    end

    it {should belong_to (:question)}
    it {should have_many(:votes)}

end
