# Feature: Edit a question
#   As a user
#   I want to edit a question
#   So I can fix my mistake


feature 'Edit a Question' do

  # Scenario: User edits a question with valid data
  #  Given I am a user
  #  When I edit a question
  #  Then I should see the question index page with the edited stuff
  scenario 'User Edits a Question with Valid Data' do
    visit questions_path
    fill_in 'Title', :with => "How the hell does OAuth work?"
    fill_in 'Content', :with => "So I've tried all these things and nothing is working. Can someone please help?"
    click_button 'Save Question'

    click_link("Edit Question")
    fill_in 'Content', :with => ""
    fill_in 'Content', :with => "I FIGURED IT OUT"
    click_button 'Save Question'

    expect(page).to have_content "I FIGURED IT OUT"
  end


end
