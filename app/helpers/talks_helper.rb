module TalksHelper
  def talk_for(year, code)
    talk = Talk.find_by_year_and_code(year, code)
    yield talk, talk_path(:year => year, :locale => I18n.locale, :id => code)
  end

  def speaker_for_timetable(speaker)
    return nil unless speaker
    shorten = speaker.gsub(/\([^\(]+\)/, "").strip
    shorten = shorten.gsub(/（.+）/, "").strip
    shorten = shorten.gsub(/\(.*$/, "")
    shorten
  end

  def render_hikidoc(str)
    HikiDoc.to_html(str,{:use_wiki_name => false})
  end
end
