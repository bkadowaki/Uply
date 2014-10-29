def set_current_user
  @user = create(:user)
  sign_in @user
end

def set_current_company
  @company = create(:company)
  sign_in @company
end
