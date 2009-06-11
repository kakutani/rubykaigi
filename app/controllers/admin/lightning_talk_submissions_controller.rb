class Admin::LightningTalkSubmissionsController < AdminController
  def index
    @lightning_talk_submissions = LightningTalkSubmission.all
  end

  def show
  end

end
