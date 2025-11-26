# backup_shell

ファイルとディレクトリをバックアップするためのシンプルなシェルスクリプト。

## 特徴

- 使いやすいコマンドラインツール
- 増分バックアップをサポート
- 設定可能なバックアップ先

## インストール

リポジトリをクローンしてスクリプトを実行:

```bash
git clone https://github.com/hnaoki/backup_shell.git
cd backup_shell
chmod +x backup.sh
```

## 使用方法

ソースと宛先のパスを指定してスクリプトを実行:

```bash
./backup.sh /path/to/source /path/to/destination
```

## ライセンス

MIT License