include ApplicationHelper

def sign_in(user, options={})
  if options[:no_capybara]
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
  else
    visit signin_path
    fill_in 'Email',    with: user.try(:email)
    fill_in 'Password', with: user.try(:password)
    click_button 'Sign in'
  end
end

%w[error notice success].each do |kind|
  RSpec::Matchers.define "have_#{kind}_message" do |message|
    match do |page|
      expect(page).to have_selector("div.alert.alert-#{kind}", text: message)
    end
  end
end
