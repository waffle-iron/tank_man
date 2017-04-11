require 'rails_helper'

describe 'when a guest visits the root page' do
  it ' they see a button to login' do
    visit root_path

    within('#navbar') do
      expect(page).to have_content("Sign in with Google")
      expect(page).to_not have_content("logout")
    end
  end
end