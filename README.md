# koto-stack

kotodとcpuminer-yescryptでソロマイニングを手軽に試すための VM です。

`VirtualBox 5.1.30 r118389`, `Vagrant 2.0.1` で動作確認しています。

# 利用方法

```
# VM起動します
vagrant up
```

起動したら、 `root@192.168.56.21` に秘密鍵 `setup/id_rsa` でSSHログインできます。

```
cd /vagrant

# サブモジュールを更新します
git submodule update --init --recursive
cd koto-stack
```

koto-stackの利用方法は[koto-stack](https://github.com/akrfjmt/koto-stack)を参照してください。

