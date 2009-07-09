require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Talk do
  context "ja/en talk" do
    before do
      params = {
        "year" => 2009,
        "room" => "room.rubykaigi2009.hall",
        "start_at" => "2009-07-18 13:30",
        "end_at" => "2009-07-18 14:30",
        "code" => "18H05",
        "email" => "matz at ruby-lang dot org",
        "ja" => {
          "title" => "基調講演",
          "abstract" => "毎年恒例のキーノートです",
          "speaker" => "まつもとゆきひろ(NaClとか)",
          "profile" => "Rubyのパパ",
        },
        "en" => {
          "title" => "Keynote Address",
          "abstract" => "Annual keynote address by creator of Ruby.",
          "speaker" => "Matz(NaCl)",
          "profile" => "Creator of Ruby",
        }
      }
      stub(Talk).save!
      @talk = Talk.create_from_json(params.to_json)
    end
    context "ja" do
      before do
        I18n.locale = "ja"
      end
      subject { @talk }

      it { subject.title.should == "基調講演" }
      it { subject.abstract.should == "毎年恒例のキーノートです" }
      it { subject.speaker.should == "まつもとゆきひろ(NaClとか)" }
      it { subject.profile.should == "Rubyのパパ" }

      describe "#to_json" do
        before do
          json = @talk.to_json
          @talk_json = ActiveSupport::JSON.decode(json)
        end
        subject { @talk_json["talk"] }
        it { subject["code"].should == "18H05" }
        it { subject["title"].should == "基調講演" }
        it { subject["abstract"].should == "毎年恒例のキーノートです" }
        it { subject["speaker"].should == "まつもとゆきひろ(NaClとか)" }
        it { subject["profile"].should == "Rubyのパパ" }
      end
    end
    context "en" do
      before do
        I18n.locale = "en"
      end
      subject { @talk }

      it { subject.title.should == "Keynote Address" }
      it { subject.abstract.should == "Annual keynote address by creator of Ruby." }
      it { subject.speaker.should == "Matz(NaCl)" }
      it { subject.profile.should == "Creator of Ruby" }
    end

  end
end

describe Talk do
  context "ja/en talk" do
    before do
      params = {
        "year" => 2009,
        "room" => "room.rubykaigi2009.hall",
        "start_at" => "2009-07-17 13:30",
        "end_at" => "2009-07-17 14:30",
        "code" => "17H01",
        "email" => "schacon at gmail dot com",
        "en" => {
          "title" => "Using Git and GitHub...",
          "abstract" => "Git is the districuted version controll system...",
          "speaker" => "Scott Chacon (GitHub)",
          "profile" => "github guy",
        }
      }
      stub(Talk).save!
      @talk = Talk.create_from_json(params.to_json)
    end
    context "ja" do
      before do
        I18n.locale = "ja"
      end
      subject { @talk }

      it { subject.title.should == "Using Git and GitHub..." }
      it { subject.abstract.should == "Git is the districuted version controll system..." }
      it { subject.speaker.should == "Scott Chacon (GitHub)" }
      it { subject.profile.should == "github guy" }
    end
    context "en" do
      before do
        I18n.locale = "en"
      end
      subject { @talk }

      it { subject.title.should == "Using Git and GitHub..." }
      it { subject.abstract.should == "Git is the districuted version controll system..." }
      it { subject.speaker.should == "Scott Chacon (GitHub)" }
      it { subject.profile.should == "github guy" }
    end

  end
end
