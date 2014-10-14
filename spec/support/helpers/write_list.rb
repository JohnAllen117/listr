def write_list(user)
  sign_in_as(@user)
  visit root_path

  click_on "New List"
  fill_in "Title", with: "This is a list."
  fill_in "Content", with: "Content"

  click_button "Create List"

  expect(page).to have_content "List Created"
end
