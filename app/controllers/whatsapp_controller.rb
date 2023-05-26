class WhatsappController < ApplicationController
  include Dog
  include HTTParty

  def create
    binding.break
    body = params['Body'].downcase
    response = Twilio::TwiML::MessagingResponse.new

    response.message do |message|
      if body.include?('dog')
        message.body(fact)
        message.media(picture)
      end
      message.body('Solo sé sobre perros o gatos, ¡lo siento!') unless body.include?('dog')
    end

    render xml: response.to_xml
  end
end
