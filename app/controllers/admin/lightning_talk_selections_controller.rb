class Admin::LightningTalkSelectionsController < AdminController
  def index
    # TODO move to model
    @grouped_talks = LightningTalkSelection.all.group_by(&:result).inject({}){|h,g| h[g.first] = g.last.map(&:lightning_talk_submission);h}
  end

  def show
  end

  def update
    submission = LightningTalkSubmission.find(params[:lightning_talk_submission_id])
    if request.xhr?
      selection = submission.selection
      result_type = params[:selection][:result]
      selection.result = result_type
      selection.save!
      render(:partial => "admin/lightning_talk_submissions/selection",
        :locals => { :selection => selection })
   else
      render :nothing => true
    end
  end

end
