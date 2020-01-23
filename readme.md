GitHub Actionsの素振りリポジトリ

[ワークフローを設定する](https://help.github.com/ja/actions/automating-your-workflow-with-github-actions/configuring-a-workflow)を元に進めている。

# メモ

## ワークフローファイルについて

- `.github/workflow`配下に`.yml` or `.yaml`ファイルを作成する
- [ワークフロー構文](https://help.github.com/ja/actions/automating-your-workflow-with-github-actions/workflow-syntax-for-github-actions)を元に記述
- コミット、push

### 使用制限

プラン、ジョブ実行時に使用するOSによって、使用制限が異なる。

- [参考 - ワークフロー構文 - 使用制限](https://help.github.com/ja/actions/automating-your-workflow-with-github-actions/workflow-syntax-for-github-actions#usage-limits)

### 構文

#### トリガー

- 以下の条件でワークフローを実行（トリガー）できる
  - GitHub内のイベント（Push / PR / etc...）
  - cron式による時間駆動
  - 外部イベント

cron式については以下を参照。

- [Qiita - crontabのガイドライン](https://qiita.com/onomame/items/71646c5517a39bcd01cc)
