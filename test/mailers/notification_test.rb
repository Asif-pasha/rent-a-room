require 'test_helper'

class NotificationTest < ActionMailer::TestCase
  test "confirmmail" do
    mail = Notification.confirmmail
    assert_equal "Confirmmail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
