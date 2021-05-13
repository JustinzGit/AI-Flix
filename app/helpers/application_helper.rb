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
            "<div class='text-block-error'>#{message}</div>"
        end 

        # raw helper - to_s + html_safe
        raw("<div class='error-message w-form-fail'>#{messages.join}</div>")
    end
  end 
end