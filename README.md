# BlackjackをRubyで作ってみた

## 目的
ターミナル上で遊べるBlackjackをRubyで作成する

## 要件
- Card・Deck・Player・Dealerが存在する
- Cardは、typeとnumberを持っている
  - typeは"Spade", "Diamond", "Clover", "Heart"のどれかである
  - numberは"A","2","3","4","5","6","7","8","9","10","J","Q","K"のどれかである
  - Cardはnumberの値を使ってscoreに置き換えることができる
    - numberが"A","J","Q","K"以外であれば、numberをIntegerに変換した数がスコアを表す
    - "J","Q","K"の場合は、scoreは10として扱う
    - "A"の場合は1として扱う。もし手札の総和が21に比べて10以上小さい場合は、"A"のCard一つにつき10足したスコアとみなすことができる
- DeckはCardのみを要素にもった配列cardsを持っている
  - cardsの要素数の最大値は52である
  - cardsには各type・numberをMECEに組み合わせてできる52個のCardをデフォルト値として持つ
  - draw_cardするとcardsからCardが一枚なくなる
- Playerはhandsとscoreを持っている
  - handsはCardのみを要素にもった配列である
  - scoreはIntegerである
  - draw_cardするとhandsにCardが一枚加わる
  - calculate_scoreをすると、handsのカード全てのscoreの総和でscoreが更新される
  - Playerは自分の番が来た時に、次のカードを引くか引かないか選択できる
  - scoreの値をjudgeすることでPlayerのアクションを制限する
    - もし自分のscoreが21より大きくなった場合は負け
    - 自分のスコアが21ちょうどの場合はそれ以上カードを引かない
      - さらに、handsが2の場合は「ブラックジャック」となって、その時点で勝ちが確定する
- Dealerはhandsとscoreを持っている
  - handsはCardのみを要素にもった配列である
  - scoreはIntegerである
  - draw_cardするとhandsにCardが一枚加わる
  - calculate_scoreをすると、handsのカード全てのscoreの総和でscoreが更新される
  - Dealerはscoreが16以上になるまで、自分の番が来た時に次のカードを引き続ける
  - scoreの値をjudgeすることでDealerのアクションを制限する
    - もし自分のscoreが21より大きくなった場合は負け
    - 自分のスコアが21ちょうどの場合はそれ以上カードを引かない
      - さらに、handsが2の場合は「ブラックジャック」となって、その時点で勝ちが確定する
- ゲームは、下記の流れで進行する。
  - 各人カードを2枚ずつ引く
    - この時点でブラックジャックになっていないか確認し、もしなっていた場合はなっていた人が勝ち。
    - PlayerはDealerが最初に引いたカードのnumberだけ知ることができる。
  - Playerのターン
    - 一度引くのをやめるまで、何度でもカードを引くことができる
  - Dealerのターン
    - 一度引くのをやめるまで、何度でもカードを引くことができる
  - 最終結果発表
    - scoreが大きい方の勝ち

## 追加予定機能
- 賭けポイント機能
  - ファイルを開いた時に一律で10000ポイント付与　
  - それがなくなる or 途中で止めるコマンドを入力 するまで続くようにする
- スプリット機能
- ダブル機能
- サレンダー機能
- バストするメソッドがあると便利そう？？
