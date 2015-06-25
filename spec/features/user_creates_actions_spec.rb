feature "user creates action" do
  

  scenario "logged out users can't create actions" do
    pending
    visit root_path
    page.should_not have_content("Welcome back! Create an Action.")
    visit new_user_action_path
    should_be_denied_access
  end

  scenario "happy path publish action" do
    current_user = Fabricate(:user)
    # sign_in_as_a_valid_user
    visit new_user_action_path(@current_user.id)
  end
end
