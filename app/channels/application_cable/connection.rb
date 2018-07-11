module ApplicationCable
  class Connection < ActionCable::Connection::Base
  	identified_by :uuid

  	def connect
  		user=User.find(cookies[:user_id])
  		if user.has_role? :admin
  			self.uuid = "admin" 
  		else
  			self.uuid = cookies[:user_id] 
  		end
  	end
  end
end
