module ApplicationHelper
  def contact_section?
    controller.controller_name == 'contacts'
  end
end
