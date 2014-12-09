require 'rails_helper'

RSpec.describe Question, :type => :model do

    it "is invalid without a title" do
      question = Question.new(title: nil, content: "Hey")
      result = question.save
      expect(result).to eq(false)
    end

    it "is invalid without content" do
      question = Question.new(title: "Example", content: nil)
      result = question.save
      expect(result).to eq(false)
    end

    it {should have_many(:votes)}
    it {should have_many(:answers)}

end
