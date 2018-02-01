#!/bin/sh
# ファイルの中に行がない場合追加する
# $1 ファイル
# $2 公開鍵
lineinfile () {
    if grep -qs "$2" $1; then
      :
    else
      echo "$2" >> $1
    fi
}

# ファイルのモードと所有者を変更する
# $1 ファイル
# $2 モード 
# $3 ユーザーとグループ user:group形式の文字列
chmod_chown () {
    chmod $2 $1 
    chown $3 $1 
}