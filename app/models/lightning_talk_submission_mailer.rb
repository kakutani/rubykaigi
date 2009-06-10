class LightningTalkSubmissionMailer < ActionMailer::Base
  def submission_received(submission)
    subject 'RubyKaigi2009 Lightning Talks Submission Received'
    recipients submission.email
    from       configatron.action_mailer.from
    bcc        configatron.action_mailer.bcc if Rails.env.production?
    sent_on Time.now
    body :submission => submission
  end
end
