require "rails_helper"

RSpec.feature "Login", type: :feature do
  let!(:user_admin) {FactoryBot.create :user, admin: true}
  let!(:user) {FactoryBot.create :user, admin: false}

  before do
    visit root_path
  end

  context "Login success" do
    scenario "role: user" do
      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: user.password
      click_button "commit"
      expect(page).to have_text I18n.t "month_report.title.month_report"
    end

    scenario "role: admin" do
      fill_in "session[email]", with: user_admin.email
      fill_in "session[password]", with: user_admin.password
      click_button "commit"
      expect(page).to have_text I18n.t "alert.welcome_admin"
    end
  end

  context "Invalid input" do
    scenario "missing email" do
      fill_in "session[password]", with: user.password
      click_button "commit"
      expect(page).to have_text I18n.t "flash.invalid_account"
    end

    scenario "missing password" do
      fill_in "session[email]", with: user.email
      click_button "commit"
      expect(page).to have_text I18n.t "flash.invalid_account"
    end

    scenario "missing all field" do
      click_button "commit"
      expect(page).to have_text I18n.t "flash.invalid_account"
    end
  end

  context "Login failed" do
    scenario "wrong username & password" do
      fill_in "session[email]", with: "abc@mail.com"
      fill_in "session[password]", with: "password"
      click_button "commit"
      expect(page).to have_text I18n.t "flash.invalid_account"
    end
  end
end
