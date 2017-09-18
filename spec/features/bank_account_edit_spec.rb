require 'rails_helper'

feature 'Bank Account Edit', js: true do
  login_js

  context 'edit an existing bank account' do
    before(:each) do
      @bank_account = FactoryGirl.create(:bank_account, user: @user)
      visit edit_bank_account_path(@bank_account)
    end

    scenario 'form is uploading to the page' do
      find('#partial_form')
    end

    scenario 'static header is showing' do
      expect(page).to have_content('Editing Bank Account:')
    end

    scenario 'header has institution name' do
      expect(page).to have_content(@bank_account.institution)
    end

    scenario 'link to go back to bank accounts index exists' do
      expect(page).to have_selector('#back-to-home')
    end
  end
end
