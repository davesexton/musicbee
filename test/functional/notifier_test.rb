require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "order_acknowledge" do
    mail = Notifier.order_acknowledge
    assert_equal "Order acknowledge", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "order_notifier" do
    mail = Notifier.order_notifier
    assert_equal "Order notifier", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "contact_acknowledge" do
    mail = Notifier.contact_acknowledge
    assert_equal "Contact acknowledge", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "contact_notifier" do
    mail = Notifier.contact_notifier
    assert_equal "Contact notifier", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
