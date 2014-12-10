class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html {redirect_to @question, notice: 'Question successfully created.'}
        format.js
      else
        format.html {render action: "index"}
        format.js
      end
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  def edit
    @question = Question.find(params[:id])

  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(question_params)
    redirect_to @question
  end

  def upvote
    @question = Question.find(params[:id])
    @vote = @question.votes.new(value: true)
    respond_to do |format|
      if @vote.save
        format.html {redirect_to root_path}
        format.js
      else
        format.html {render action: "index"}
        format.js
      end
    end
  end

  def downvote
    @question = Question.find(params[:id])
    @vote = @question.votes.new(value: false)

    respond_to do |format|
      if @vote.save
        format.html {redirect_to root_path}
        format.js
      else
        format.html {render action: "index"}
        format.js
      end
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :content)
  end
end
