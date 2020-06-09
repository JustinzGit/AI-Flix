module ApplicationHelper
  def format_date(date)
    Date.parse(date).strftime('%B %d, %Y')
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end
end
