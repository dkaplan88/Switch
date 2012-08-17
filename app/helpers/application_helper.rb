module ApplicationHelper
  
  def format_date(date_time)
    date_time.strftime("%c")
  end
end
