class LightningTalkSubmissionsController < LocaleBaseController
  layout proc{|c| "ruby_kaigi#{c.params[:year]}" }

  before_filter :check_submission_closed, :only => :index # 書いている途中のはPOSTしてもよい

  # GET /lightning_talk_submissions
  def index
    @lightning_talk_submission = LightningTalkSubmission.new(
      :day1 => LightningTalkSubmission::RubyKaigi2009.day1,
      :day2 => LightningTalkSubmission::RubyKaigi2009.day2)
    year = params[:year]
    render :template => "lightning_talk_submissions/#{year}/#{action_name}_#{params[:locale]}"
  end

  # POST /lightning_talk_submissions
  def create
    @lightning_talk_submission = LightningTalkSubmission.new(params[:lightning_talk_submission])

    if @lightning_talk_submission.save
      begin
        LightningTalkSubmissionMailer.deliver_submission_received(@lightning_talk_submission)
      rescue
        logger.error "LightningTalkSubmissionMailer.deliver_submission_received failed"
        logger.error $!
      end
      redirect_to :action => 'thankyou'
    else
      year = params[:year]
      render :template => "lightning_talk_submissions/#{year}/index_#{params[:locale]}"
    end
  end

  def thankyou
    year = params[:year]
    render :template => "lightning_talk_submissions/#{year}/#{action_name}_#{params[:locale]}"
  end

  private
  def check_submission_closed
    unless lt_submission_open?
      year = params[:year]
      render :template => "lightning_talk_submissions/#{year}/closed"
    end
    true
  end
end
