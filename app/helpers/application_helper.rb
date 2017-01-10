module ApplicationHelper
  
  def nav_status(controller)
    if params[:controller] == controller
      'active'
    end 
  end

end
