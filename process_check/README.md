# Process Check

## プロセス監視＆自動再起動スクリプト
[process_check.sh](process_check/process_check.sh)
### 概要
指定したサービスやプロセスが正常に動作しているかを定期的にチェックします。  
もしプロセスが停止していた場合、自動的に再起動を試み、結果を確認します。  
サーバーの安定性を保つための便利なツールです。
### 使い方
1. 'TARGET_SERVICES' を編集して、監視したいプロセス名を追加してください。
2. サービスの起動に時間がかかる場合は 'START_WAIT_TIME' を調整しましょう。
3. cron ジョブを設定して定期的に実行します。  
   例: `*/5 * * * * /path/to/process_check.sh >> /var/log/process_check.log 2>&1`

