class LightningTalkSubmissionsController < LocaleBaseController
  layout proc{|c| "ruby_kaigi#{c.params[:year]}" }

  before_filter :basic_auth_required_by_admin, :only => :list

  # GET /lightning_talk_submissions
  def index
    @lightning_talk_submission = LightningTalkSubmission.new
    year = params[:year]
    render :template => "lightning_talk_submissions/#{year}/#{action_name}_#{params[:locale]}"
  end

  def list
    @lightning_talk_submissions = LightningTalkSubmission.all
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
end
