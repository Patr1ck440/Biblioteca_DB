class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :admin_or_librarian?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def admin_or_librarian?
    current_user&.role.in?(%w[admin librarian])
  end

  def require_login
    redirect_to login_path, alert: "Trebuie să fii autentificat" unless logged_in?
  end

  def require_admin_or_librarian
    redirect_to root_path, alert: "Acces interzis" unless admin_or_librarian?
  end
end