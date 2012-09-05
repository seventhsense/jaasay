class MessagesController < ApplicationController
  def index
    @messages = Message.order('created_at desc')
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    @message.template_id = 1
    @message.save!
    redirect_to root_path
  end
end
