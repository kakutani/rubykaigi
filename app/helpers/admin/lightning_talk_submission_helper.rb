module Admin::LightningTalkSubmissionHelper
  def render_selection_radio_of(form, submission, selection, result_type)
    radio_button = form.radio_button(
      "result", result_type,
      { :id => "submission_#{submission.id}_selection_result_#{result_type.abs}",
        :onchange => remote_function(
          :update => dom_id(selection, :selection),
          :url =>  admin_lightning_talk_submission_lightning_talk_selection_path(submission),
          :method => :put,
          :with => "'selection[result]=#{result_type}&lightning_talk_submission_id=#{submission.id}'"
          )})
    label_tag = <<-LABEL
<label for="submission_#{submission.id}_selection_result_#{result_type.abs}">#{result_type_label_of(result_type)}</label>&nbsp;
    LABEL
    "#{radio_button}#{label_tag}"
  end

  def result_type_label_of(type)
    case type
    when LightningTalkSelection::Result.initial
      "未審査"
    when LightningTalkSelection::Result.rejected
      "不採用"
    when LightningTalkSelection::Result.day1_2009
      "金曜日(2009-07-17)"
    when LightningTalkSelection::Result.day2_2009
      "土曜日(2009-07-18)"
    else
      raise "Not Yet Specified label for LightningTalkSelection::Rejected: '#{type}'"
    end
  end
end
