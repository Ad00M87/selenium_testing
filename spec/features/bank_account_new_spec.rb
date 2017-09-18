require 'rails_helper'

feature 'Bank Account New', js: true do
  login_js

  context 'create a new bank account' do
    before(:each) do
      visit new_bank_account_path
    end

    scenario 'form is uploading to the page' do
      find('#partial_form')
    end

    scenario 'static header is showing' do
      expect(page).to have_content('New Bank Account For:')
    end

    scenario 'header has institution name' do
      expect(page).to have_content(@user.email)
    end

    scenario 'link to go back to bank accounts index exists' do
      expect(page).to have_selector('#back-to-home')
    end
  end
end
