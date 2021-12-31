GitHub Apps による操作しろいろ
===

# インストール

https://docs.github.com/ja/developers/apps/building-github-apps/creating-a-github-app
を参考にすすめる

```bash
# smee に送られたリクエストを localhost:3000/event_handler へ
npx smee -u https://smee.io/{生成されたID} --path /event_handler --port 3000

# localhost:3000/event_handler を起動 -> GitHub Apps インストール時のリクエストをさばく
bundle exec ruby github_apps_install_server.rb
```

# GitHub Apps のインストールアクセストークン取得 -> 試しに API アクセス

https://docs.github.com/ja/developers/apps/building-github-apps/authenticating-with-github-apps#
を参考に進める

```bash
bundle exec ruby install_app_access.rb
```
