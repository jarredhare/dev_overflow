class QuestionsController < ApplicationController
  def index
    @question = Question.new
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end


  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def upvote
    @question = Question.find(params[:id])
    @question.votes.create(value: true)
    redirect_to questions_path
  end

  def downvote
    @question = Question.find(params[:id])
    @question.votes.create(value: false)
    redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:title, :content)
  end
end
