module Admin::LightningTalkSelectionsHelper
  def render_disp_order(talk, idx)
    ""
#    "#{up_command(talk, idx)}&nbsp;#{down_command(talk, idx)}&nbsp;"
  end

  private
  def up_command(talk, idx)
    return "[−]" if @group.first == talk
    "[" << command_link("▲", :up, talk, idx) << "]"
  end

  def down_command(talk, idx)
    return "[−]" if @group.last == talk
    "[" << command_link("▼", :down, talk, idx) << "]"
  end
end
