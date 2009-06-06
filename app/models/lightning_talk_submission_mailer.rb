class LightningTalkSubmissionMailer < ActionMailer::Base
  def submission_received(submission)
    subject 'RubyKaigi2009 Lightning Talks Submission Received'
    recipients submission.email
    from '2009@rubykaigi.org'
    bcc '2009@rubykaigi.org'
    sent_on Time.now
    body :submission => submission
  end
end
