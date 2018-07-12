module ApplicationCable
  class Connection < ActionCable::Connection::Base
  	identified_by :uuid

  	def connect
  		self.uuid= "conversation_#{cookies[:conversation_id] if cookies[:conversation_id]}"     
      if cookies[:user_id]
        user=User.find(cookies[:user_id])
        if user.has_role? :admin
         self.uuid = "admin" 
       end
      end
  	end
  end
end