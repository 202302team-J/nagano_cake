
# チームJ：ケー虎

## 🚩 目次

- [紹介](#紹介)
- [成果物](#成果物)
- [作成時のルール](#作成時のルール)
- [難しかったところ](#難しかったところ)
- [学んだこと](#学んだこと)
- [参考文献](#参考文献)

## 紹介

- DMMWEBCAMPのチーム開発演習の一環として、長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発を行いました。<br>

- [紹介スライド](https://docs.google.com/presentation/d/1fBmYOFJNFa69ucSDAl0D3LkGciKIPj2eVfQO7O5tU9g/edit#slide=id.g6579491373_0_32)

- チーム目標：`それぞれの長所を最大限に活かし、協働力と完成度の高いＥＣサイトを作る`

## 成果物

- [ER図（Draw.ioで作成）](https://drive.google.com/file/d/1aWqPs2Z2vr3CsvGyjZ2mY_DF4sIbj1_C/view?usp=share_link)
- [詳細設計書](https://docs.google.com/spreadsheets/d/111PHSGENQ7MOQoq3DXGonh4RQsxVqUOAgbJHZsElK1M/edit#gid=549108681)
- [テーブル定義書](https://docs.google.com/spreadsheets/d/1hYEI72zMymGN604k4Gx4H0SFgqfMh-cVnCnwE2OsrzA/edit?usp=share_link)

## 作成時のルール

### ブランチに関して

- `main: リリース用　/ develop: 統合用 / developから各自派生ブランチ`
- 大文字は使用しない
- ブランチ名は「`カテゴリ名-名前-(管理者用ならadを追加)-内容`」としました。<br>
[カテゴリ表]

| 名前 | 用途 | 補足 |
| --- | --- | --- |
| feature | 機能の追加、リファクタリング |  |
| bugfix | バグ修正 |  |
| hotfix | 緊急の修正を行う | リリース後、緊急のバグへの対応する際に使用。 |
| test | テスト用 |  |

### 毎日の議事録

本日のタスクや、メンバーと共有したい事などを記録するためのgoogleスプレッドシートを作成し、認識のすり合わせや備忘録として活用しました。
[`チームJ　議事録`](https://docs.google.com/spreadsheets/d/1kpx2Ifo_r11LiUdmIwMK4GqiMhcgfFX4iSNhE7Y7Cl4/edit#gid=257413993)<br>
知識を共有し問題とその解決策を記録することで、効率的な学習が行えました。

## 難しかったところ

- enumの設定方法(ymlファイルと日本語設定)
- 中間テーブルを理解しての作成(ER図含め).
- 詳細設計書にてURLの作成.<br>
- 商品画像の表示に関して
- コントローラに実現したい処理をどう記述するか(特にcartやorder)
- 注文ステータスと製作ステータスを連動させる構造
- フォームやテーブルなどのレイアウト

## 学んだこと

- 個性を活かして取り組むことで、進捗や完成度にいい影響を与えること

- 実際の現場での取り組み方の感覚

- 役割分担・スケジュール管理の大切さ

## 参考文献

- [`GitHub – READMEの作成方法と書き方【改行やリンク・画像の入れ方】`](https://howpon.com/8334)
- [`とほほのBootstrap 4入門`](https://www.tohoho-web.com/bootstrap/index.html)