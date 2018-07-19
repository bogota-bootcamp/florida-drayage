class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  	stream_from "user_#{uuid}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)  	
  end
end
