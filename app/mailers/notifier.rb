class Notifier < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_acknowledge.subject
  #
  def order_acknowledge
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_notifier.subject
  #
  def order_notifier
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.contact_acknowledge.subject
  #
  def contact_acknowledge(message)
    @message = message
    @greeting = "Hi"

    mail to: message.email,
         from: APP_CONFIG['email_from'],
         subject: 'Contact Confirmation from Music Bee'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.contact_notifier.subject
  #
  def contact_notifier(message)
    @message = message
    @greeting = "Hi"

    mail to: APP_CONFIG['email_to'],
         subject: 'New Contact Messafe from Music Bee'
  end
end
