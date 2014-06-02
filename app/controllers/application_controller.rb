class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_administrator!
    authenticate_maker! 
    unless current_maker.administrator
      flash[:error] = t('messages.forbidden')
      redirect_to root_path
    end
  end
end
