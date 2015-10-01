class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_uname(params[:uname])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside a browser cookie.
      # Specifically, the rails 'session'. This is how we keep the user
      # logged in when they navigate around our website.
      set_user_session(user)
      redirect_to root_url, notice: 'Successfully logged in!'
    else
      # If user's login doesn't work, send them back to the login form.
      flash[:alert] = "Username or email did not match"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Successfully Logged Out. Goodbye!'
  end

  private

  def set_user_session(user)
    session[:logged_in_users_id] = user.id
  end
end
