class Admin::LightningTalkSubmissionsController < AdminController
  def index
    @lightning_talk_submissions = LightningTalkSubmission.all
  end

  def show
    @submission = LightningTalkSubmission.find(params[:id])
    @seq = params[:seq] || 0
  end

end
