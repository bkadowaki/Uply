def set_current_user
  @user = create(:user)
  sign_in @user
end
