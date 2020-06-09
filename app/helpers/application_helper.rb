module ApplicationHelper
  def format_date(date)
    Date.parse(date).strftime('%B %d, %Y')
  end
end
