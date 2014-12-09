class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :votes, as: :votable

  validates :title, presence: true
  validates :content, presence: true
end
