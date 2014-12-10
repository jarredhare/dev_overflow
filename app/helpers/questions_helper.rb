module QuestionsHelper
  def vote_count(question)
    question.votes.where(value: true).count - question.votes.where(value: false).count
  end

  def github_welcome
    baseurl = 'https://api.github.com/zen'
    email = ENV['EMAIL']
    password = ENV['PASSWORD']
    auth = {username: email, password: password }
    response = HTTParty.get(baseurl, basic_auth: auth)

    unless response.code == 403
      response.body
    else
      Faker::Company.bs
    end
  end

end
