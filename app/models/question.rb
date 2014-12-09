class Question < ActiveRecord::Base
  has_many :answers
  has_many :votes, as: :votable
  validates :title, presence: true
  validates :content, presence: true
end
