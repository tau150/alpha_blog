class SessionsController < ApplicationController

  def new
    
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase) #busco en los params que me manda el form el email del user, params es un hash con todo lo que mande en el form
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id #este user id sera guardado por el navegador en sessions hash
      flash[:success] = 'You have sucessfully logged in'
      redirect_to user_path(user)
    else
      flash.now[:danger] = 'There was something wron with your login information'
      render 'new'
    end
end

  def destroy
    session[:user_id] = nil #cierro la sesion del usuario
    flash[:success] = 'You have logged out'
    redirect_to root_path

  end

end

