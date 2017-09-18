require 'rails_helper'

feature 'Bank Account Show', js: true do
  login_js

  context 'bank account information' do
    before(:each) do
      @bank_account = FactoryGirl.create(:bank_account, user: @user)
      visit bank_account_path(@bank_account)
    end

    scenario 'correct show content' do
      expect(page).to have_content(@bank_account.institution)
      expect(page).to have_content(@bank_account.description)
      expect(page).to have_content('More Info')
      expect(page).to have_content('Ledger Transactions')
      expect(page).to have_content(@bank_account.ledger[0][:ledger_change])
      expect(page).to have_content(@bank_account.ledger[0][:previous_amount])
      expect(page).to have_content(@bank_account.ledger[0][:new_amount])
    end

    scenario 'link to edit bank account exists' do
      expect(page).to have_selector('#edit-bank-account')
    end

    scenario 'link to go back to bank accounts index exists' do
      expect(page).to have_selector('#back-to-home')
    end
  end

end
