class TransitionalController < ApplicationController

  skip_before_filter :authorize

  def index
  end

  def about
  end

  def samples
    @songs = Song.all.sample(10)
  end

  def contents
    @products = Product.all
  end

  def contact
    @message = Message.new unless @message
  end

  def contact_send
    @message  = Message.new(params[:message])
    if verify_recaptcha(model: @message) and @message.valid?
      Notifier.contact_notifier(@message).deliver
      Notifier.contact_acknowledge(@message).deliver
      @message.save
      respond_to do |format|
        format.html { redirect_to root_url,
                      notice: 'Message was successfully sent.' }
      end
    else
      respond_to do |format|
        format.html { redirect_to contact_url,
                      notice: 'Message not sent, please complete all fields.' }
      end
    end
  end

end
