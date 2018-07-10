module ApplicationCable
  class Connection < ActionCable::Connection::Base
  	identified_by :uuid

  	def connect
  		self.uuid = current_user.id
  	end
  end
end
