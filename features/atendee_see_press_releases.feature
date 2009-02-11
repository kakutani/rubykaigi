フィーチャ 参加者向け情報を提供する
  RubyKaigi参加者として
  公式リリースされたページを閲覧したい

  シナリオ 日本語のRubyKaigi2009のCFPを閲覧する
    前提 言語は"ja-JP"
    もし RubyKaigi2009の"トップページ"にアクセスする
    ならば "日本Ruby会議2009"と表示されていること
    かつ   "RubyKaigi2009のテーマは、「変わる／変える」です。 前回"と表示されていること
    かつ   "プレゼンテーション募集概要"と表示されていること
    かつ   "スポンサー募集について"と表示されていること

    もし   "Permalink"リンクをクリックする
    ならば "プレゼンテーション募集概要"と表示されていること
    かつ   "RubyKaigi2009のテーマは、「変わる／変える」です。 前回"と表示されていないこと

  シナリオ 英語のRubyKaigi2009のCFPを閲覧する
    前提 言語は"en-US"
    もし RubyKaigi2009の"トップページ"にアクセスする
    ならば "RubyKaigi2009"と表示されていること
    かつ   "RubyKaigi2009 will be held at Hitotsubashi Conference Hall"と表示されていること
    かつ   "Call for presentations"と表示されていること
    かつ   "Call for Sponsors"と表示されていること

    もし   "Permalink"リンクをクリックする
    ならば "Call for presentations"と表示されていること
    かつ   "RubyKaigi2009 will be held at Hitotsubashi Conference Hall"と表示されていないこと

  シナリオ リンクをたどって明示的に言語を切り替える
    前提 言語は"en-US"
    もし RubyKaigi2009の"トップページ"にアクセスする
    ならば "RubyKaigi2009"と表示されていること
    かつ   "RubyKaigi2009 will be held at Hitotsubashi Conference Hall"と表示されていること
    かつ   "RubyKaigi2009のテーマは、「変わる／変える」です。 前回"と表示されていないこと

    もし   "ja"リンクをクリックする
    ならば "RubyKaigi2009のテーマは、「変わる／変える」です。 前回"と表示されていること
    かつ   "RubyKaigi2009 will be held at Hitotsubashi Conference Hall"と表示されていないこと

