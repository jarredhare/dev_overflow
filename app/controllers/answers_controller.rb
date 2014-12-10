class AnswersController < ApplicationController
  def index
  end

  def new
    @question = Question.find(params[:question_id])
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html {redirect_to question_path(params[:question_id]), notice: 'Answer successfully created.'}
        format.js
      else
        format.html {render action: "index"}
        format.js
      end
    end
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
