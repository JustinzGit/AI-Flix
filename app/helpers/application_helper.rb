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

  def display_form_errors(object)
    errors = object.errors.full_messages

    if errors.any?
        messages = errors.each.map do |message|
            content_tag(:p, message)
        end 

        # raw helper - to_s + html_safe
        raw(messages.join)
    end
  end 
end
