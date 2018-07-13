module ApplicationCable
  class Connection < ActionCable::Connection::Base
  	identified_by :uuid

  	def connect  		     
      if cookies[:user_id]
        user=User.find(cookies[:user_id])
        if user.has_role? :admin
         self.uuid = "admin" 
       end
      elsif cookies[:conversation_id]
        self.uuid= "conversation_#{cookies[:conversation_id]}"      
      end
      # prioritize client sesion over admin sesion
      # how to delete cookies ?
      
  	end
  end
end