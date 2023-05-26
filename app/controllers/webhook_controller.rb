class WebhookController < ApplicationController

  def index
    @messages = Message.all
  end

  def create
    message = Message.new(params[:message])
    message.save

    # Send a message back to the user
    Twilio::ActiveSupport::Logging.logger.info("Sending message back to user")
    Twilio::Messaging.new.message(
      to: message.from,
      from: +14402982570,
      body: "Hi there, I got your message!"
    )

    redirect_to messages_path
  end
end
