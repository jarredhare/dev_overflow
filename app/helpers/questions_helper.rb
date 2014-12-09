module QuestionsHelper
  def vote_count(question)
    question.votes.where(value: true).count - question.votes.where(value: false).count
  end

end
