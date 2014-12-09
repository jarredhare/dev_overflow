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

  private
  def answer_params
    params.require(:answer).permit(:title, :content)
  end
end
