# Closet box

洋服管理アプリケーション
<br><br>

## 概要

自分のクローゼットの中の洋服の写真を撮ってカテゴリ別に分けて保存が出来ます。  
さらに、自分が保存したアイテムを組み合わせてコーディネートが投稿出来ます。  
また、他のユーザーのコーディネートを見て、いいね、コメントをすることで
ユーザー間の交流が行えます。
<br><br>

## 接続先情報

- URL [http://18.177.14.233/]
- テスト用ログインアカウント
  - メールアドレス：'hoge@gmail.com'
  - パスワード：hogehoge

### デモ

![](https://s4.aconvert.com/convert/p3r68-cdx67/bf9gn-bc5y6.gif)
<br><br>

## 開発環境

- OS
  - Mac OS
- 言語
  - Ruby 2.5.1
- フレームワーク
  - Ruby on Rails 5.2.3
- フロントエンド
  - Haml, Sass, JavaScript ライブラリ：jQuery
- データベース
  - MySQL
- コード管理
  - Git, GitHub
- エディタ
  - Visual Studio Code
- デプロイ
  - AWS, EC2, S3 自動デプロイ：Capistrano
<br><br>

## 機能一覧

- ユーザー新規登録・ログイン機能

- ユーザーマイページ機能

- アイテム保存機能

- アイテム編集機能及び削除機能

- コーディネート投稿機能

- コーディネート一覧表示機能及びページネーション機能

- コーディネート詳細表示機能

- コーディネート編集機能及び削除機能

- コーディネートにコメント投稿機能及び削除機能

- コーディネートにいいね機能

- ユーザー間フォロー機能
<br><br>

## その他使用技術

- ユーザー新規登録・ログイン
  - gem deviseを使用

- 画像アップロード
  - gem carrierwaveを使用

- ページネーション
  - gem kaminariを使用