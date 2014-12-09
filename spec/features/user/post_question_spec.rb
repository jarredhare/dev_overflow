# Feature: Post a question
#   As a user
#   I want to post a question
#   So I can get an answer


feature 'Post a Question' do

  # Scenario: User posts a question with valid data
  #  Given I am a user
  #  When I post a question
  #  Then I should see a successful post message
  scenario 'User Posts a Question with Valid Data' do
    visit questions_path
    fill_in 'Title', :with => "How the hell does OAuth work?"
    fill_in 'Content', :with => "So I've tried all these things and nothing is working. Can someone please help?"
    click_button 'Save Question'
    expect(page).to have_content "How the hell does OAuth work?"
  end


end
