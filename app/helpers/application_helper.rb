# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def contact_section?
    controller.controller_name == 'contacts'
  end
end
