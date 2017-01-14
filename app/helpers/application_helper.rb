module ApplicationHelper
  
  def redirect_to_tweets 
  	link_to "Meus Tweets", user_activities_path(current_user)
  end

  def redirect_to_edit
  	link_to "Editar Perfil", edit_user_path(current_user) 	
  end

end
