require 'rails_helper'

feature "User can sign in and out" do

  let(:user) { build(:user) }

  context "user not signed in and on the homepage", type: :user do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "user signed in on the homepage", type: :user  do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: user.email)
      fill_in('Password', with: user.password)
      fill_in('Password confirmation', with: user.password_confirmation)
      click_button('Sign up')
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end
