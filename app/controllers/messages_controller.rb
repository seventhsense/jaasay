class MessagesController < ApplicationController
  def index
    @messages = Message.order('created_at desc').limit(5)
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    @message.template_id = 1
    @message.save!
  end
end
