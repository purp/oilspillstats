module Admin::EventsHelper
  def icon_for(event)
    "<img src='#{event.icon}' alt='icon' />" if event.icon && !event.icon.blank?
  end
end
