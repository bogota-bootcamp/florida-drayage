module ApplicationCable
  class Connection < ActionCable::Connection::Base
  	identified_by :uuid

  	def connect  		
  		self.uuid = cookies[:user_id] if cookies[:user_id]
  	end
  end
end
