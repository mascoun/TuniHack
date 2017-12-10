class SessionsController < ApplicationController

  def new
    user = User.new
    render layout: false
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) && user.approved?
        log_in user
        redirect_back_or root_path
    else
       flash.now[:danger] = 'Invalid email/password combination'
       render :new, layout: false
    end
  end

  def destroy
    log_out if logged_in?
     render :new
  end



  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end

  protected




end
