# WORKTOWN
早稲田大学創造理工学部経営システム工学科２年春学期「情報システム開発演習」の最終課題です。
> 経営システムに貢献する情報システムを開発するためには，システム開発者だけでなく，情報システムの利用者や発注者もシステムライフサイクルと開発プロセスの概要の理解が求められている．本講義は，仮想的なアパレル企業の販売業務の改善を例題にして，ＷＥＢ技術を用いた販売管理システム開発の要求分析，システム設計，プログラム作成，テスト，および運営に至る開発ライフサイクルを，演習を通じて擬似的に体験し，システムライフサイクルの基本事項を実務的な側面から学ぶ事を目的としている．最終回には，選抜された学生によって経営システムの改善成果に関する発表を行う．
> WEB販売管理システムの開発の疑似体験を通して，以下を実務的な側面より習得することを目標とする．
> 
> ・ライフサイクル：情報システムの基本的なライフサイクルを理解する
> ・要求定義：経営システム への要求を分析し，情報システムの仕様を定義する基本的な手法・技術を理解し，演習問題に対して適用できるようになる．
> ・システム設計：情報システムの典 型的な形態であるWEBシステムの基本的な構造と，その設計の手法・技術を理解し，演習問題に対して適用できるようになる．
> ・実装：WEBシス テムの基本的な実装手法・技術を理解し，演習問題に対して適用できるようになる．
 
![商品一覧画面](https://user-images.githubusercontent.com/66343258/123548125-77399880-d79e-11eb-8aed-a8a98ea1cd05.png)
![商品詳細画面](https://user-images.githubusercontent.com/66343258/123548134-8a4c6880-d79e-11eb-83eb-502db82e85f5.png)
![購入内容確認画面](https://user-images.githubusercontent.com/66343258/123548164-a18b5600-d79e-11eb-8fc9-4f4ae303c528.png)
![購入完了画面](https://user-images.githubusercontent.com/66343258/123548179-aea84500-d79e-11eb-981e-ad1ae461ed65.png)
![購入履歴確認画面(認証)](https://user-images.githubusercontent.com/66343258/123548192-bb2c9d80-d79e-11eb-91ce-d0ee3dc2a563.png)
![購入履歴確認画面](https://user-images.githubusercontent.com/66343258/123548208-cbdd1380-d79e-11eb-948e-928c5af476bd.png)
![ユーザー登録画面](https://user-images.githubusercontent.com/66343258/123548220-d5667b80-d79e-11eb-9b0f-28ce959a09d4.png)

| 対象顧客層 | 肉体労働をしている２０〜３０代の男性 |
| 主要販売商品 | 男性向けの作業着 |
|典型的な購買シーン|欲しいものがあらかじめ決まっており、その商品だけを買う（普通のファッションサイトはとりあえず見てみて、気に入ったら買うということが多い）|
|ビジネスの特徴|あらかじめ必要なものが決まっている顧客が多い あまりWEB サイトに精通していない人が多い → シンプルなデザインにする|
|商品選択方法|カテゴリによる絞り込み、検索|
|付加機能|口コミ機能、検索機能、カテゴリ検索機能、会員登録機能、購入履歴確認機能|

# 開発環境
Java Server Pages
MySQL(H2)
Tomcat
