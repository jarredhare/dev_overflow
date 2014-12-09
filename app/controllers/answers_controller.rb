class AnswersController < ApplicationController
  def index
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    redirect_to question_path(params[:question_id])
  end

  def upvote
    @answer = Answer.find(params[:answer_id])
    @answer.votes.create(value: true)
    redirect_to question_path(params[:question_id])
  end

  def downvote
    @answer = Answer.find(params[:answer_id])
    @answer.votes.create(value: false)
    redirect_to question_path(params[:question_id])
  end

  private
  def answer_params
    params.require(:answer).permit(:title, :content)
  end
end
