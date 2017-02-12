class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # Esto se traduce: primero no quiero que vaya multiples veces a la base a buscar el user, por lo tanto,
    #@current_user al principio se fija si ya tengo uno y ||= significa sino(if not), user.find me busca y retorna de la base el user que tenga el id que este en la session.
  end

  def logged_in?
    !!current_user #!! me convierte a boolean, por ende en base al otro metodo me devuelve true o false.
 end

def require_user
  if !logged_in?
    flash[:danger] = 'You must be logged in to perform that action'
    redirect_to root_path
  end
end



end
