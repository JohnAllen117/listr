require 'rails_helper'
feature 'User likes a list' do
let(:user) { FactoryGirl.create(:user) }
let(:list) { FactoryGirl.create(:list) }
  scenario 'successfully' do
    sign_in_as(user)
    visit list_path(list)
    click_on 'Like'

    expect(page).to have_content 'Liked!'
  end

  scenario 'unsuccessfully' do
    visit list_path(list)

    expect(page).not_to have_content 'Like'
  end
end

feature 'User unlikes a list' do
let(:user) { FactoryGirl.create(:user) }
let(:list) { FactoryGirl.create(:list) }
  scenario 'successfully' do
    sign_in_as(user)
    visit list_path(list)
    click_on 'Like'
    click_on 'Unlike'

    expect(page).to have_content 'Like'
  end
end
