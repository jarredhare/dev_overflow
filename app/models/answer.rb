class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :votes, as: :votable, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
end
