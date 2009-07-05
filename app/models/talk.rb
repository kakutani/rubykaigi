class Talk < ActiveRecord::Base
  has_many :descriptions, :class_name => "TalkDescription", :dependent => :destroy

  validates_presence_of :code, :email

  #
  # named scopes
  #
  named_scope :year, Proc.new { |year| { :conditions => [ "year = ?", year ] } }

  class << self
    def create_from_json(json_str)
      json = ActiveSupport::JSON.decode(json_str)
      talk = Talk.new({
          :year => json["year"],
          :email => json["email"],
          :code => json["code"],
          :room => json["room"],
          :start_at => json["start_at"],
          :end_at => json["end_at"]
        })
      if (desc_ja = json["ja"])
        talk.descriptions.build({
            :locale => "ja",
            :title => desc_ja["title"],
            :abstract => desc_ja["abstract"],
            :speaker => desc_ja["speaker"],
            :profile => desc_ja["profile"]
          })
      end
      if (desc_en = json["en"])
        talk.descriptions.build({
            :locale => "en",
            :title => desc_en["title"],
            :abstract => desc_en["abstract"],
            :speaker => desc_en["speaker"],
            :profile => desc_en["profile"]
          })
      end
      talk.save!
      talk
    end
  end

  def title
    description.title
  end

  def abstract
    description.abstract
  end

  def speaker
    description.speaker
  end

  def profile
    description.profile
  end

  def description
    desc = descriptions.detect {|d| d.locale == I18n.locale }
    desc or fallback_desc(I18n.locale)
  end

  private
  def fallback_desc(locale)
    if locale == "ja" && (desc = descriptions.first).locale == "en"
      desc
    else
      TalkDescription.new(
        :title => "(TBD)",
        :abstract => "(TBD)",
        :speaker => "(TBD)",
        :profile => "(TBD)"
        )
    end
  end

end
