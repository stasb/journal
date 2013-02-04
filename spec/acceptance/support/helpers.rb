module HelperMethods
  # Put helper methods you need to be available in all acceptance specs here.

  def sign_in(user)
    visit log_in_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Submit"
  end

end

RSpec.configuration.include HelperMethods, :type => :acceptance
