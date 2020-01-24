![](https://github.com/zakizaki-ri9/github-actions-sandbox/workflows/Hello,%20World!/badge.svg)
![](https://github.com/zakizaki-ri9/github-actions-sandbox/workflows/Cron%20Test/badge.svg)
![](https://github.com/zakizaki-ri9/github-actions-sandbox/workflows/Nodejs%20Directory%20Push/badge.svg)
![](https://github.com/zakizaki-ri9/github-actions-sandbox/workflows/Checkout/badge.svg)

GitHub Actionsの素振りリポジトリ

[ワークフローを設定する](https://help.github.com/ja/actions/automating-your-workflow-with-github-actions/configuring-a-workflow)を元に進めている。

---

以降、素振りした際のメモ

# ワークフローファイルについて

- `.github/workflow`配下に`.yml` or `.yaml`ファイルを作成する
- [ワークフロー構文](https://help.github.com/ja/actions/automating-your-workflow-with-github-actions/workflow-syntax-for-github-actions)を元に記述
- コミット、push

## 使用制限

プラン、ジョブ実行時に使用するOSによって、使用制限が異なる。

- [参考 - ワークフロー構文 - 使用制限](https://help.github.com/ja/actions/automating-your-workflow-with-github-actions/workflow-syntax-for-github-actions#usage-limits)

## 構文

### トリガー

- 以下の条件でワークフローを実行（トリガー）できる
  - GitHub内のイベント（Push / PR / etc...）
  - cron式による時間駆動
  - 外部イベント

cron式については以下を参照。

- [Qiita - crontabのガイドライン](https://qiita.com/onomame/items/71646c5517a39bcd01cc)
  - 最短のインターバルは**5分毎**

#### [特定のブランチ、タグ、パスに対してのトリガー](https://help.github.com/ja/actions/automating-your-workflow-with-github-actions/configuring-a-workflow#filtering-for-specific-branches-tags-and-paths)

```yml
on:
  push:
    branches:
      - master
    tags:
      - v1
    paths:
      - 'nodejs/*'
```

[nodejs.yml](.github/workflows/nodejs.yml)を参照

### アクション

- GitHub標準アクションが用意されている - [Organization actions](https://github.com/actions)

#### [チェックアウトアクション](https://github.com/actions/checkout)

リポジトリをチェックアウトするアクション、以下のような用途で使用する。

- Lintチェック
- ビルド
- テスト
- etc...

```yml
# 使用例
- uses: actions/checkout@v2
```
