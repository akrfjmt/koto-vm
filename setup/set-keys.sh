#!/bin/sh
# vagrantユーザ, rootユーザについて秘密鍵でログインできるようにする

__DIR__=`dirname "${0}"`
. "${__DIR__}/lib.sh"

PUBLIC_KEY=`cat ${__DIR__}/id_rsa.pub`
PRIVATE_KEY=`cat ${__DIR__}/id_rsa`

## vagrantユーザ
### 秘密鍵を配置
echo "${PRIVATE_KEY}" > /home/vagrant/.ssh/id_rsa
chmod_chown /home/vagrant/.ssh/id_rsa 600 vagrant:vagrant
### authorized_keysに公開鍵を追加
lineinfile /home/vagrant/.ssh/authorized_keys "${PUBLIC_KEY}"

## rootユーザ
### sshディレクトリを作成
mkdir -p /root/.ssh
chmod_chown /root/.ssh 700 root:root
### 秘密鍵を配置
echo "${PRIVATE_KEY}" > /root/.ssh/id_rsa
chmod_chown /root/.ssh/id_rsa 600 root:root
### authorized_keysを作成
touch /root/.ssh/authorized_keys
chmod_chown /root/.ssh/authorized_keys 600 root:root
### authorized_keysに公開鍵を追加
lineinfile /root/.ssh/authorized_keys "${PUBLIC_KEY}"

## 設定を反映するため、sshdを再起動する
systemctl restart sshd
