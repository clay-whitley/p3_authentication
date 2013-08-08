helpers do

  def current_user
    # TODO: return the current user if there is a user signed in.
    return session[:current_user] if session[:current_user]
  end

end
