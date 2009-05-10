フィーチャ: CFPとスポンサーを日本語と英語で募集したい
  募集中だった当初はトップページに表示されていたが、
  募集が終了したのでトップページにはもう表示していない

  シナリオテンプレート: トップページで言語に応じた募集内容のリンクを表示する
    前提 言語は"<言語>"
    もし RubyKaigi2009の"トップページ"にアクセスする
	ならば   "<CFPタイトル>"が表示されていないこと
	かつ   "<スポンサー募集タイトル>"が表示されていないこと

    例:
    |言語|CFPタイトル|スポンサー募集タイトル|
    |ja-JP|プレゼンテーション募集概要|スポンサー募集について|
    |en-UP|Call for presentations|Call for Sponsors|
    |zh-TW|Call for presentations|Call for Sponsors|

  シナリオテンプレート: RubyKaigi2009の募集ページをPermalinkで閲覧する
    もし "/2009/<言語>/<ページ名>"にアクセスする
    ならば "<ページのタイトル>"が表示されていること

    例:
    |言語|ページ名|ページのタイトル|
    |ja  |CallForPresentations|プレゼンテーション募集概要|
    |en  |CallForPresentations|Call for presentations|
    |ja  |CallForSponsors|スポンサー募集について|
    |en  |CallForSponsors|Call for Sponsors|

  シナリオテンプレート: URLに言語指定を含めない場合にはリダイレクトされる
    前提 言語は"<言語>"
    もし RubyKaigi2009の"<ページ名>"にアクセスする
    ならば "<ページのタイトル>"が表示されていること

    例:
    |言語|ページ名|ページのタイトル|
    |ja  |CallForPresentations|プレゼンテーション募集概要|
    |en  |CallForPresentations|Call for presentations|
    |ja  |CallForSponsors|スポンサー募集について|
    |en  |CallForSponsors|Call for Sponsors|
