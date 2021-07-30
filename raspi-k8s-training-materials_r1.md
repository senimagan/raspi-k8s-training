# ラズパイでコンテナに触れてみよう

## 目次

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [ラズパイでコンテナに触れてみよう](#ラズパイでコンテナに触れてみよう)
  - [目次](#目次)
  - [はじめに、、、](#はじめに)
  - [1. ハードウェア組み立て](#1-ハードウェア組み立て)
    - [1.1 必要な機材の確認](#11-必要な機材の確認)
      - [各チームで必要な機材](#各チームで必要な機材)
      - [共有可能な機材（1台のみあれば問題なし）](#共有可能な機材1台のみあれば問題なし)
    - [1.2 組み立て](#12-組み立て)
  - [2. OS(Raspberry Pi OS)インストール](#2-osraspberry-pi-osインストール)
    - [2.1 SDカードの準備](#21-sdカードの準備)
      - [前提](#前提)
      - [手順](#手順)
    - [2.2 Raspberry Pi OSイメージの用意](#22-raspberry-pi-osイメージの用意)
    - [2.3 Raspberry Pi OSイメージをSDに書き込み（インストール）](#23-raspberry-pi-osイメージをsdに書き込みインストール)
  - [3. OS(Raspberry Pi OS)設定](#3-osraspberry-pi-os設定)
    - [3.1 キーボードレイアウト変更](#31-キーボードレイアウト変更)
    - [3.2 タイムゾーン変更](#32-タイムゾーン変更)
    - [3.3 swapの無効化](#33-swapの無効化)
    - [3.4 ユーザ名パスワード変更](#34-ユーザ名パスワード変更)
    - [3.5 Hostname変更](#35-hostname変更)
    - [3.6 Wi-Fi接続とIP固定化](#36-wi-fi接続とip固定化)
    - [3.7 パッケージの更新](#37-パッケージの更新)
    - [3.8 SSH サービス起動設定](#38-ssh-サービス起動設定)
  - [4. Kubernetes のインストール／設定](#4-kubernetes-のインストール設定)
    - [4.1 Dockerのインストール](#41-dockerのインストール)
    - [4.2 kubeadm, kubectl, kubeletのインストール](#42-kubeadm-kubectl-kubeletのインストール)
    - [4.3 Kubernetesクラスタの構築](#43-kubernetesクラスタの構築)
    - [4.4 （おまけ）各コマンドの補完機能の有効化](#44-おまけ各コマンドの補完機能の有効化)
  - [5. Ingressの有効化](#5-ingressの有効化)
    - [5.1 Nginx Ingress Controllerのデプロイ](#51-nginx-ingress-controllerのデプロイ)
    - [5.2 Ingressの動作確認](#52-ingressの動作確認)
  - [6. k8sクラスタのメトリクス表示](#6-k8sクラスタのメトリクス表示)
    - [6.1 3.5インチディスプレイの設定(Masterのみ)](#61-35インチディスプレイの設定masterのみ)
    - [6.2 metrics-serverの追加](#62-metrics-serverの追加)
    - [6.3 ディスプレイにメトリクスを表示する](#63-ディスプレイにメトリクスを表示する)
      - [（おまけ）samplerの起動時自動実行設定](#おまけsamplerの起動時自動実行設定)

<!-- /code_chunk_output -->
<div style="page-break-before:always"></div>

## はじめに、、、

本日の研修で、完成するクラスタを紹介します！！

![raspi-1](raspi-k8s-training-materials_r1.assets/raspi-1.png)

## 1. ハードウェア組み立て

Raspberry Piを開封し、ラックにマウントしケーブル類を接続します。

### 1.1 必要な機材の確認

#### 各チームで必要な機材

1. Raspberry Pi × 3
2. ディスプレイ
3. USBキーボード
4. microSDカード × 3
5. HDMI × microHDMI変換コネクタ
6. Raspberry Pi 用積層式ケース
7. Raspberry Pi 専用LCDモニター
8. ACアダプタ × 3
9. 充電用TypeCケーブル(USB) × 3
10. 社用iPhone
11. 個人SS10端末(ドキュメント参照・調査用)

#### 共有可能な機材（1台のみあれば問題なし）

1. 書込みPC（SDカード書込可能なPC）

<div style="page-break-before:always"></div>

### 1.2 組み立て

多少機材が異なりますが、以下サイトに組み立て方法が記載されているので参考ください。  
https://developers.cyberagent.co.jp/blog/archives/14721/

以下は組み立て時点のRaspberry Piのイメージ図です。

![第1章完了時点のイメージ図](raspi-k8s-training-materials_r1.assets/chapter1-16273583378831.png)

この時点ではRaspberry PiにはOSもインストールされていないので起動しません。

## 2. OS(Raspberry Pi OS)インストール

Raspberry Pi OS イメージを SD カードへインストールします。  
本章では、書込みPC およびSDカード3枚を利用します。  

以下はRaspberry Pi OSをインストールした後のイメージ図です。

![第2章完了時点のイメージ図](raspi-k8s-training-materials_r1.assets/chapter2.png)

第2章の手順を完了することで、Raspberry Piをコンピュータとして起動できるようになります。

### 前提

- SDカードは購入時の状態であること
- 書込PCはWindows10であること

<div style="page-break-before:always"></div>

### 2.1 Raspberry Pi OSイメージをSDに書き込み（インストール）

1. **Raspberry Pi Imager for Windows** を https://downloads.raspberrypi.org/imager/imager_latest.exe からダウンロード

2. ダウンロードしたEXEを実行し、Raspberry Pi Imager for Windowsをインストール

3. PCにSDカードを挿入

4. Raspberry Pi Imagerを起動

   <img src="raspi-k8s-training-materials_r1.assets/image-20210727092354463.png" alt="image-20210727092354463" style="zoom:67%;" />

5. [CHOOSE OS]をクリックし、OS選択画面を開く

   <img src="raspi-k8s-training-materials_r1.assets/image-20210727105132865.png" alt="image-20210727105132865" style="zoom:67%;" />

   <img src="raspi-k8s-training-materials_r1.assets/image-20210727092419170.png" alt="image-20210727092419170" style="zoom:67%;" />

6. [Raspberry Pi OS (other)]をクリックし、[Raspberry Pi OS Lite (32-bit)]を選択

   <img src="raspi-k8s-training-materials_r1.assets/image-20210727105241405.png" alt="image-20210727105241405" style="zoom:67%;" />

   <img src="raspi-k8s-training-materials_r1.assets/image-20210727105428663.png" alt="image-20210727105428663" style="zoom:67%;" />

   <img src="raspi-k8s-training-materials_r1.assets/image-20210727092539714.png" alt="image-20210727092539714" style="zoom:67%;" />

7. [CHOOSE STORAGE]をクリックし、ストレージ選択画面を開く

   <img src="raspi-k8s-training-materials_r1.assets/image-20210727105812028.png" alt="image-20210727105812028" style="zoom:67%;" />

   <img src="raspi-k8s-training-materials_r1.assets/image-20210727092602464.png" alt="image-20210727092602464" style="zoom:67%;" />

8. SDカードをマウントしているドライブを選択

   この例では[SDHC Card - 31.9 GB] を選択

   <img src="raspi-k8s-training-materials_r1.assets/image-20210727110136845.png" alt="image-20210727110136845" style="zoom:67%;" />

   <img src="raspi-k8s-training-materials_r1.assets/image-20210727092626020.png" alt="image-20210727092626020" style="zoom:67%;" />

9. 選択内容を確認し、[WRITE]をクリックしてSDカードへデータを書き込む

   <img src="raspi-k8s-training-materials_r1.assets/image-20210727110251673.png" alt="image-20210727110251673" style="zoom:67%;" />

   [WRITE]をクリックすると 以下のような警告が出る場合があるが、[YES]をクリックし続行。

   <img src="raspi-k8s-training-materials_r1.assets/image-20210727110528920.png" alt="image-20210727110528920" style="zoom:67%;" />

   書き込みが完了すると以下のようなメッセージが表示される。

   <img src="raspi-k8s-training-materials_r1.assets/image-20210727093524388.png" alt="image-20210727093524388" style="zoom:67%;" />

これを3台分実施する。  

<div style="page-break-before:always"></div>

## 3. iPhoneの設定変更

### 3.1 インターネット共有時のSSIDの変更

iPhoneではインターネット共有時のSSIDがデフォルトでは `○○のiPhone` となっており、SSIDに日本語が含まれている。

Raspberry Piでは日本語を含むSSIDのWi-Fiには接続できないため、iPhoneのインターネット共有時のSSIDを変更する。
SSIDはiPhoneの名前と同一であるため、iPhoneの名前を一時的に変更する。本研修完了後は元に戻してよい。

1. ホーム画面から[設定]を開く

   <img src="raspi-k8s-training-materials_r1.assets/image-20210727171442650.png" alt="image-20210727171442650" style="zoom:50%;" /> <img src="raspi-k8s-training-materials_r1.assets/image-20210727172925785.png" alt="image-20210727172925785" style="zoom:50%;" />

2. [一般]を選択

   <img src="raspi-k8s-training-materials_r1.assets/image-20210727173117483.png" alt="image-20210727173117483" style="zoom:50%;" /> <img src="raspi-k8s-training-materials_r1.assets/image-20210727173217014.png" alt="image-20210727173217014" style="zoom:50%;" />

3. [情報]を選択

   <img src="raspi-k8s-training-materials_r1.assets/image-20210727173310093.png" alt="image-20210727173310093" style="zoom:50%;" /> <img src="raspi-k8s-training-materials_r1.assets/image-20210727173601325.png" alt="image-20210727173601325" style="zoom:50%;" />

4. [名前]を選択

   <img src="raspi-k8s-training-materials_r1.assets/image-20210727173705350.png" alt="image-20210727173705350" style="zoom:50%;" /> <img src="raspi-k8s-training-materials_r1.assets/image-20210727174055345.png" alt="image-20210727174055345" style="zoom:50%;" />

5. 名前を `raspi-k8s-network` に変更

   <img src="raspi-k8s-training-materials_r1.assets/image-20210727174221045.png" alt="image-20210727174221045" style="zoom:50%;" /> <img src="raspi-k8s-training-materials_r1.assets/image-20210727174453586.png" alt="image-20210727174453586" style="zoom:50%;" />

### 3.2 iPhoneのインターネット共有を有効化

1. ホーム画面から[設定]を開く

   <img src="raspi-k8s-training-materials_r1.assets/image-20210727171442650.png" alt="image-20210727171442650" style="zoom:50%;" /> <img src="raspi-k8s-training-materials_r1.assets/image-20210727172925785.png" alt="image-20210727172925785" style="zoom:50%;" />

2. [インターネット共有]を選択

   <img src="raspi-k8s-training-materials_r1.assets/image-20210727175856053.png" alt="image-20210727175856053" style="zoom:50%;" /> <img src="raspi-k8s-training-materials_r1.assets/image-20210727180103692.png" alt="image-20210727180103692" style="zoom:50%;" />

3. [ほかの人の接続を許可]をONに変更

   <img src="raspi-k8s-training-materials_r1.assets/image-20210727180242379.png" alt="image-20210727180242379" style="zoom:50%;" /> 



## 4. OS(Raspberry Pi OS)設定

Raspberry Pi OS インストール後、OS の初期設定を実施します。  
**なお、4.1から4.10までの手順はすべてのノードで実行してください**

以下はOSの初期設定後のイメージ図です。

![第3章完了時点のイメージ図](raspi-k8s-training-materials_r1.assets/chapter3.png)

第4章の手順完了後、各ノードははiPhoneを介してインターネットに接続できるようになります。
また、以降の手順のためにホスト名やユーザ名などOSの各種設定を変更します。

### 4.1 キーボードレイアウト変更

キーボードのレイアウトを日本語に変更します。

1. Raspberry Piにディスプレイ、キーボードを接続し、起動
2. Username: `pi`, Password: `raspberry`でログイン
3. `sudo raspi-config`を実行
4. `5 Localisation Options`を選択
5. `L3 Keyboard`を選択
6. `Generic 105-key PC (intl.)`を選択
7. `Other`を選択
8. `Japanese`を選択
9. `Japanese - Japanese (OADG 109A)`を選択
10. `The default for the keyboard layout`を選択
11. `No compose key`を選択

### 4.2 タイムゾーン変更

タイムゾーンを日本(`Asia/Tokyo`)に変更します。

2. `5 Localisation Options`を選択
3. `L2 Timezone`を選択
4. `Asia`を選択
5. `Tokyo`を選択
6. `<Finish>`を選択

### 4.3 ハードウェアとOSの確認

```bash
# Raspberry Piのモデルを確認（個体によってはRev 1.2ではない場合もある）
$ more /proc/device-tree/model
Raspberry Pi 4 Model B Rev 1.2

# OSを確認
$ lsb_release -a
No LSB modules are available.
Distributor ID: Raspbian
Description:    Raspbian GNU/Linux 10 (buster)
Release:        10
Codename:       buster
```



### 4.4 ユーザ名とパスワードの変更

Raspberry Piは初期ユーザ/初期パスワードが決まっており、初期ユーザ/初期パスワードのままで運用しているとよくサイバー攻撃の対象となります。そのため、本演習でもユーザ名とパスワードを変更することで、初期ユーザ/初期パスワードを無効化しています。
本演習では作業の簡素化と統一のためパスワードは極めて簡易なものに設定していますが、本来であればより複雑なパスワードにしたり、公開鍵認証のみ設定したりする方が良いでしょう。

1. 仮ユーザ( `tmp` ユーザ)を作成 
   ※パスワードはユーザ名(`tmp`)と同じものを設定ください

   ```bash
   # ホームディレクトリなしでtmpユーザを作成
   $ sudo useradd -M tmp
   
   # tmpユーザをsudoグループに追加し、sudoの実行権限を付与
   $ sudo gpasswd -a tmp sudo
   Adding user tmp to group sudo
   
   # tmpユーザのパスワードを変更
   $ sudo passwd tmp
   New password: <パスワードを入力>
   Retype new password: <パスワードを入力>
   passwd: password updated successfully
   ```
   
2. Raspberry Piを再起動

   ```bash
   $ sudo reboot
   ```

3. 仮ユーザ(Username: `tmp`, Password: `tmp`)でログイン

4. `pi`ユーザのユーザ名を変更

   ```bash
   # usermod -lでユーザ名をpiからtarteに変更
   $ sudo usermod -l tarte pi
   
   # usermod -dでホームディレクトリを/home/piから/home/tarteに変更
   $ sudo usermod -d /home/tarte -m tarte
   
   # groupmod -nでpiグループをtarteグループに変更
   $ sudo groupmod -n tarte pi
   ```

   ユーザ名が`tarte`、ホームディレクトリが`/home/tarte`へ変更されていることを確認

   ```bash
   $ cat /etc/passwd | grep tarte
   tarte:x:1000:1000:,,,:/home/tarte:/bin/bash
   ```

5. Raspberry Piを再起動

   ```bash
   $ sudo reboot
   ```

6. Username: `tarte`, Password: `raspberry`でログイン

7. 仮ユーザ(`tmp`ユーザ)を削除

   ```bash
   # 仮ユーザを削除
   $ sudo userdel tmp
   ```

   `tmp`ユーザが削除されたことを確認

   ```bash
   # 実行後に何も表示されないことを確認
   $ cat /etc/passwd | grep tmp
   ```

8. tarteユーザのパスワードを変更  
   ※パスワードはユーザ名(`tarte`)と同じものを設定すること

   ```bash
   # tarteユーザのパスワードを変更
   $ sudo passwd tarte
   New password: <パスワードを入力>
   Retype new password: <パスワードを入力>
   passwd: password updated successfully
   ```

9. piユーザのパス無しsudo設定を削除

   ```bash
   $ sudo rm /etc/sudoers.d/010_pi-nopasswd
   ```

10. Raspberry Piを再起動

    ```bash
    $ sudo reboot
    ```

### 4.5 Hostname変更

本研修ではMasterノード1台、Workerノード2台の構成で構築するので、各ノードがどの役割なのか識別できるようHostnameを変更します。

1. Username: `tarte`, Password: `tarte`でログイン
2. `sudo raspi-config`を実行
3. `1 System Options`を選択
4. `S4 Hostname`を選択
5. Hostnameに関する注意を確認し、`<Ok>`を選択
6. 変更したいhostnameを入力
   - "raspi-k8s-master"
   - "raspi-k8s-worker01"
   - "raspi-k8s-worker02"
7. `<Ok>`を選択
8. `<Finish>`を選択
9. Rebootの確認が表示されるので、`<Yes>`を選択

### 4.6 swapの無効化

スワップが有効だと kubelet が起動しないので無効化します。

1. Username: `tarte`, Password: `tarte`でログイン

2. swapを無効化

    ```bash
    # swapを無効化
    $ sudo swapoff -a
    $ sudo systemctl disable dphys-swapfile.service
    ```

### 4.7 cgroupsのmemoryサブシステムの有効化

1. memoryサブシステムが有効化されているか確認

   `memory 0`と表示された場合は以降の手順を実施する。`memory 1`と表示された場合は次の章に進む。

   ```bash
   # "memory 0"と表示されらた以降の手順を実施
   # "memory 1"の場合は次の章に進む
   $ cat /proc/cgroups | grep memory | awk '{print $1,$4}'
   memory 0
   ```

2. `/boot/cmdline.txt` を変更する

   ```bash
   # memoryサブシステムを有効化する記述を追記
   $ sudo sed -i "s/$/ cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory/" /boot/cmdline.txt
   
   # 追記されていることを確認
   $ cat /boot/cmdline.txt
   console=seria10,115200 console=tty1 root=PARTUUID=efaac79d-02 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory
   ```

3. Raspberry Piを再起動

   ```bash
   $ sudo reboot
   ```

4. Username: `tarte`, Password: `tarte`でログイン

5. memoryサブシステムが有効化されていることを確認

   ```bash
   # "memory 1"と表示されることを確認
   $ cat /proc/cgroups | grep memory | awk '{print $1,$4}'
   memory 1
   ```

### 4.8 Wi-Fi接続とIPアドレス固定化

#### 4.8.1 iPhoneのインターネット共有の設定を確認

1. ホーム画面から[設定]を開く
   
   <img src="raspi-k8s-training-materials_r1.assets/image-20210727171442650.png" alt="image-20210727171442650" style="zoom:50%;" /> <img src="raspi-k8s-training-materials_r1.assets/image-20210727172925785.png" alt="image-20210727172925785" style="zoom:50%;" />
   
2. [インターネット共有]を選択

   <img src="raspi-k8s-training-materials_r1.assets/image-20210727175856053.png" alt="image-20210727175856053" style="zoom:50%;" /> <img src="raspi-k8s-training-materials_r1.assets/image-20210727180103692.png" alt="image-20210727180103692" style="zoom:50%;" />

3. [ほかの人の接続を許可]をONになっていることを確認

   "Wi-Fi"のパスワードはこの後使用するのでメモしておくこと。

   <img src="raspi-k8s-training-materials_r1.assets/image-20210727180242379.png" alt="image-20210727180242379" style="zoom:50%;" /> 

#### 4.8.2 Wi-Fiへの接続とIPアドレスの固定化

1. Username: `tarte`, Password: `tarte`でログイン

2. `sudo raspi-config`を実行

3. `5 Localisation Options`を選択

4. `L4 WLAN Country`を選択

5. `JP Japan`を選択

6. Wi-Fi countryがJPにセットされたことを確認し、`<Ok>`を選択

7. `<Finish>`を選択

8. Rebootの確認が表示されるので、`<No>`を選択

9. wpa_supplicant.confに接続情報を追記

   Raspberry Pi上では $\backslash$​​ (半角バックスラッシュ) と $￥$​ (半角円記号)​​が区別されることに注意すること。
   以下のコマンドで使用しているのはバックスラッシュである。

   ```bash
   # <YOUR_WIFI_PASSWORD> は、各自の内容を指定ください
   $ sudo wpa_passphrase raspi-k8s-network <YOUR_WIFI_PASSWORD> | \
   sed '/#psk=/d' | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
   
   # 実行結果として以下が表示されます。
   network={
       ssid="raspi-k8s-network"
       psk=f9ca578sijd...
   }
   ```

10. `/etc/dhcpcd.conf`の最後に以下を追記

    本演習では`<IP Address>`の部分に以下を指定すること。

    - "raspi-k8s-master"    : 172.20.10.2
    - "raspi-k8s-worker01"  : 172.20.10.3
    - "raspi-k8s-worker02"  : 172.20.10.4

    ```conf
    $ cat << EOF >> /etc/dhcpcd.conf
    interface wlan0
    static ip_address=<IP Address>
    static routers=172.20.10.1
    static domain_name_servers=172.20.10.1
    EOF
    ```

11. Raspberry Piを再起動

    ```conf
    $ sudo reboot
    ```

12. Username: `tarte`, Password: `tarte`でログイン

13. インターネット接続できることを確認

    ```bash
    $ curl -Is www.google.com | head -1
    HTTP/1.1 200 OK
    ```
    
    `HTTP/1.1 200 OK`が表示されなかった場合は、下記2点を確認すること。
    
    - iPhoneのインターネット共有が有効化されている
    - Raspberry PiがiPhoneのインターネット共有に接続できている
    
    iPhoneのインターネット共有が有効化しているのに、Raspberry Piがインターネット接続できない場合はRaspberry Piを再起動してみること。

### 4.9 パッケージの更新

```bash
$ sudo apt update
$ sudo apt upgrade -y
```

### 4.10 SSH サービス起動設定

1. Raspberry Pi起動時にSSHサービスが起動されるように設定

   ```bash
   $ sudo /etc/init.d/ssh restart
   # 再起動後も sshサービスが起動する様に設定
   $ sudo systemctl enable ssh.service
   ```

2. SSHサービスが起動していることを確認

   ```bash
   # SSHサービスが起動している(結果が出力される)ことを確認
   # SSHサービスが起動していない場合は何も出力されない
   $ sudo systemctl status ssh.service | grep "Active: active"
      Active: active (running) since Wed 2021-07-28 14:44:09 51s ago
   ```

※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
※※ **4.1 から 4.10** までの作業は3台分(Master:1台、Worker:2台) 実施ください ※※ 
※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※

<div style="page-break-before:always"></div>

## 5. Kubernetes のインストール／設定

Kubernetesのインストールと各種設定を行います。
以下はKubernetesインストール・各種設定後のイメージです。

![chapter4](raspi-k8s-training-materials_r1.assets/chapter4-16274513114682.png)

第5章の手順が完了した時点で、Kubernetesとして機能する基本的なクラスタが完成します。

**5.1 - 5.2の作業はすべてのノードで実施してください。**

また、4章までの設定が完了したことで各ノード同士はSSHでアクセスできるようになっています。
ディスプレイやキーボードの抜き差しが面倒であれば、以降はSSHで各ノードを切り替えて作業を実施しても構いません。
SSHでノードを切り替える場合は操作対象を間違えないように、プロンプトに表示されるHostnameを確認するなど注意しましょう。

以下は、`raspi-k8s-master` から `raspi-k8s-worker01` に `tarte`ユーザを用いてSSHアクセスする際の例です。

```bash
tarte@raspi-k8s-master:~ $ hostname
raspi-k8s-master

tarte@raspi-k8s-master:~ $ ssh tarte@raspi-k8s-worker01.local
tarte@raspi-k8s-worker01.local's password: <パスワードを入力>
Linux raspi-k8s-worker01 5.10.17-v71+ #1421 SMP Thu May 27 14:00:13 BST 2021 armv71

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Sat May  8 01:09:55 2021

tarte@raspi-k8s-worker01:~ $ hostname
raspi-k8s-worker01
```

あるノードからあるノードへ初めてSSHする際は、以下のようなメッセージが表示されます。
この場合は指示通り、`yes` を入力すればよいです。

````bash
The authenticity of host 'raspi-k8s-worker01.local (172.20.10.3)' can't be established.
ECDSA key fingerprint is SHA256:8aCrchTAadVjjK50I+PiV85T7Jh6FpFs1VBjpUj307E.
Are you sure you want to continue connecting (yes/no)? <yesを入力>
````

### 5.1 Dockerのインストール

Kubernetesで使用するコンテナランタイムとして、Dockerをインストールします。

1. Dockerをインストール

   ```bash
   # Dockerをインストール
   $ curl -sSL https://get.docker.com | sh
   # tarteユーザでDockerを実行できるよう、dockerグループに追加
   $ sudo usermod -aG docker tarte
   ```

2. Dockerがインストールされたことを確認

   ```bash
   # 以下の出力は例であるため、実際の出力とは異なる場合がある
   $ docker --version
   Docker version 20.10.7, build f0df350
   ```

### 5.2 kubeadm, kubectl, kubeletのインストール

手順は https://kubernetes.io/ja/docs/setup/production-environment/tools/kubeadm/install-kubeadm/ を参考にしている。

1. iptablesのバックエンドとしてnftablesを使用しないように変更

   Raspberry Pi OSでは、デフォルトでiptablesのバックエンドにnftablesを使用しています。
   一方で、Kubernetes 1.18以前はnftablesに対応していないので、iptablesのバックエンドとしてiptablesが動作している必要があります。

   ```bash
   # レガシーバイナリをインストール
   $ sudo apt install -y iptables arptables ebtables

   # iptablesのバックエンドとして、iptablesが動作するように変更
   $ sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
   $ sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
   $ sudo update-alternatives --set arptables /usr/sbin/arptables-legacy
   $ sudo update-alternatives --set ebtables /usr/sbin/ebtables-legacy
   ```

2. kubeadm, kubelet, kubectlをインストール

   ```bash
   # 鍵登録
   $ curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
   sudo apt-key add -
   
   # apt のソースリストに Kubernetes を提供しているリポジトリ設定
   $ cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
   deb https://apt.kubernetes.io/ kubernetes-xenial main
   EOF
   
   # apt を更新し、Kubernetesのモジュールの情報を取得
   $ sudo apt update
   
   # Kubernetes の各モジュールをインストール
   $ sudo apt install -y kubelet kubeadm kubectl
   
   # kubelet kubeadm kubectlのバージョンを固定
   $ sudo apt-mark hold kubelet kubeadm kubectl
   ```
   
3. kubelet、kubeadm、kubectl がインストールされたことを確認

   ```bash
   # 以下の出力は例なので、実際の出力とは異なる場合がある
   # kubelet バージョン確認
   $ kubelet --version
   Kubernetes v1.21.3
   # kubeadm バージョン確認
   $ kubeadm version -o short
   v1.21.3
   # kubectl バージョン確認
   $ kubectl version --short --client
   Client Version: v1.21.3
   ```

※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※  
※※　**5.2** までの作業は3台分(Master:1台、Worker:2台)実施ください　※※  
※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※  

### 5.3 Kubernetesクラスタの構築

以降は手順の最初に明記されたノードで作業を実施すること。

1. (Master) Masterノードを初期化

   Masterノードを初期化します。 
   合わせてクラスタ内のPodが使用するネットワークアドレスを指定します。  

   ```bash
   # CNIにflannelを使用するため、10.244.0.0/16を指定
   $ sudo kubeadm init --pod-network-cidr=10.244.0.0/16
   ```

   Masterノードの初期化に成功すると次のようなメッセージが表示されます。 

   ```bash
   Your Kubernetes control-plane has initialized successfully!
   
   To start using your cluster, you need to run the following as a regular user:
   
     mkdir -p $HOME/.kube
     sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
     sudo chown $(id -u):$(id -g) $HOME/.kube/config
   
   You should now deploy a pod network to the cluster.
   Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
   https://kubernetes.io/docs/concepts/cluster-administration/addons/
   
   Then you can join any number of worker nodes by running the following on each as root:
   kubeadm join 172.20.10.2:6443 --token 1gettp.t0tchwj82mg2qfbq \
    --discovery-token-ca-cert-hash sha256:c4d3698d75c1584e78a27d4e0e2755fd79f3c78bebbe05dddf698fb4095a3ca2
   ```

2. (Master) tokenをファイルに出力

   ```bash
   # tokenを出力
   $ sudo kubeadm token list -o jsonpath='{.token}' > ~/token
   
   # tokenがファイルに出力できていることを確認
   # 以下の出力は例であり、実際は各自の出力結果とは異なる
   $ cat ~/token
   1gettp.t0tchwj82mg2qfbq
   ```
   
3. (Master) CA証明書のハッシュ値をファイルに出力

   ```bash
   # CA証明書のハッシュ値を出力
   $ openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | \
   openssl rsa -pubin -outform der 2>/dev/null | \
   openssl dgst -sha256 -hex | sed 's/^.* //' > ~/ca-cert-hash
   
   # CA証明書のハッシュ値がファイルに出力できていることを確認
   # 以下の出力は例であり、実際は各自の出力結果とは異なる
   $ cat ~/ca-cert-hash
   2608eeb6840cde591b744ee0a3ecbe8d9278096a730f91d26c4e47d3d0788ebb2
   ```

4. (Master) 出力したファイルをWorkerノードに転送

   ```bash
   # raspi-k8s-worker01にファイルを転送
   $ scp  ~/token ~/ca-cert-hash tarte@raspi-k8s-worker01.local:/home/tarte/
   # raspi-k8s-worker02にファイルを転送
   $ scp  ~/token ~/ca-cert-hash tarte@raspi-k8s-worker02.local:/home/tarte/
   ```

5. (Master) kubectlを実行できるように設定

   ```bash
   $ mkdir -p ~/.kube
   $ sudo cp /etc/kubernetes/admin.conf ~/.kube/config
   $ sudo chown $(id -u):$(id -g) ~/.kube/config
   ```

   `~/.kube` 配下に config ファイルがコピーされていること、所有者とグループが tarteになっていることを確認  

   ```bash
   $ ls -l ~/.kube/config
   -rw------- 1 tarte tarte 5595 Jul 29 10:24 /home/tarte/.kube/config
   ```

6. (Master) kubectlを実行できることを確認

   ```bash
   # この時点ではMasterノードはNotReady
   $ kubectl get node
   NAME                STATUS      ROLES                  AGE    VERSION
   raspi-k8s-master    NotReady    control-plane,master   36m    v1.21.3
   ```

7. (Master) コンテナ間通信を実現するflannelを構築

   flannelはコンテナ間通信を実現するためのContainer Network Interface(CNI)です。
   Kubernetesは様々なPod（コンテナ）が連携して動作しています。
   そのため、flannelなどのCNIを構築するまではコンテナ同士の通信ができない（＝コンテナが連携できない）ので、`raspi-k8s-master`が `NotReady`となっています。

   flannel構築後のネットワーク図は以下のようになっています。

   ![flannelのアーキテクチャ](raspi-k8s-training-materials_r1.assets/flannel_architecture.png)

   以下のコマンドを実行することで、flannelを構築することができる。

   ```bash
   $ kubectl apply -f \
   https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
   ```

8. (Master) すべてのPodがReadyになることを確認

   下記コマンドを実行すると、すべてのPodがReadyになるまで待機します。
   すべてのPodがReadyになるとコマンドが完了し、プロンプトが返ってきます。

   ```bash
   # すべてのPodがReadyになるまで待機
   # 以下の出力は例であり、実際は各自の出力結果とは異なる
   $ kubectl wait pod -A --all --for=condition=Ready --timeout=5m
   pod/coredns-558bd4d5db-2vcsl condition met
   pod/coredns-558bd4d5db-xfpwd condition met
   pod/etcd-raspi-k8s-master condition met
   pod/kube-apiserver-raspi-k8s-master condition met
   pod/kube-controller-manager-raspi-k8s-master condition met
   pod/kube-flannel-ds-zj23q condition met
   pod/kube-proxy-pv4fn condition met
   pod/kube-scheduler-raspi-k8s-master condition met
   ```

9. (Master) MasterノードがReadyになっていることを確認

   ```bash
   # この時点ではMasterノードがReadyになる
   $ kubectl get nodes
   NAME                STATUS    ROLES     AGE   VERSION
   raspi-k8s-master    Ready     master    12m   v1.21.3
   ```

10. (Worker01, Worker02) `kubeadm join`を実行し、k8sクラスタに参加

   ```bash
   $ sudo kubeadm join 172.20.10.2:6443 --token $(cat ~/token) \
   --discovery-token-ca-cert-hash sha256:$(cat ~/ca-cert-hash)
   ```

   以下のようなメッセージが表示されることを確認

   ```bash
   This node has joined the cluster:
   * Certificate signing request was sent to apiserver and a response was received.
   * The Kubelet was informed of the new secure connection details.
   
   Run 'kubectl get nodes' on the control-plane to see this node join the cluster.
   ```

   

11. (Master) worker01, worker02がReadyになることを確認

    下記コマンドを実行すると、すべてのWorkerノードがReadyになるまで待機します。
    すべてのWorkerノードがReadyになるとコマンドが完了し、プロンプトが返ってきます。

    ```bash
    # すべてのWorkerノードがReadyになるまで待機
    $ kubectl wait node -l node-role.kubernetes.io/master!="" --for=condition=Ready --timeout=5m
    node/raspi-k8s-worker01 condition met
    node/raspi-k8s-worker02 condition met
    
    # 実際にWorkerノードがReadyになっていることを確認
    $ kubeactl get node
    NAME                 STATUS   ROLES                  AGE   VERSION
    raspi-k8s-master     Ready    control-plane,master   46m   v1.21.3
    raspi-k8s-worker01   Ready    <none>                 12m   v1.21.3
    raspi-k8s-worker02   Ready    <none>                 10m   v1.21.3
    ```

12. (Master) Workerノードに役割を表すラベルを付与

    ```bash
    $ kubectl label node raspi-k8s-worker01  node-role.kubernetes.io/worker=
    node/raspi-k8s-worker01 labeled
    
    $ kubectl label node raspi-k8s-worker02  node-role.kubernetes.io/worker=
    node/raspi-k8s-worker02 labeld
    ```

13. (Master) 役割を表すラベルが付与されたことを確認

    役割を表すラベルを付与すると、ROLES列に役割が表示されるようになる。

    ```bash
    $ kubeactl get node
    NAME                 STATUS   ROLES                  AGE   VERSION
    raspi-k8s-master     Ready    control-plane,master   64m   v1.21.3
    raspi-k8s-worker01   Ready    worker                 30m   v1.21.3
    raspi-k8s-worker02   Ready    worker                 27m   v1.21.3
    ```

### 5.4 （おまけ）各コマンドの補完機能の有効化

各コマンドの保管機能を有効にすることで、コマンド入力中にTabキーで入力を保管できるようになります。

1. (Master) 補完コードをファイルに出力

   ```bash
   $ kubectl completion bash > ~/.kube/kubectl_completion.bash.inc
   
   $ kubeadm completion bash > ~/.kube/kubeadm_completion.bash.inc
   ```

2. (Master) 補完コードのファイルを`.profile`で読み込むように変更

   Raspberry Pi上では $\backslash$ (半角バックスラッシュ) と $￥$ (半角円記号)が区別されることに注意すること。
   以下のコマンドで使用しているのはバックスラッシュである。

   ```bash
   $ printf "\n# Kubectl shell completion\n\
   source ~/.kube/kubectl_completion.bash.inc\n" >> ~/.profile
   
   $ printf "\n# Kubeadm shell completion\n\
   source ~/.kube/kubeadm_completion.bash.inc\n" >> ~/.profile
   ```

3. (Master) `.profile`を再読み込み

   ```bash
   $ source ~/.profile
   ```

## 6. Ingressの有効化

Ingressを有効化することで、クラスタ外部からのアクセスやトラフィック制御、ロードバランスなどが可能になります。

以降の作業はMasterノードで実施してください。

### 6.1 Nginx Ingress Controllerのデプロイ

1. MasterにもPodをスケジュールできるように変更

   通常、Masterノードには特別なPodしかスケジュールできないようになっている。
   しかし、Raspberry Piでは使用できるリソースが少なく、Workerノード2台だけだとリソース不足になる可能性がある。
   そこで、3台のRaspberry Piのリソースを最大限利用するために、MasterノードにもPodをスケジュールできるようにしている。

   ```bash
   $ kubectl taint nodes  raspi-k8s-master node-role.kubernetes.io/master-
   ```

2. Nginx Ingress Controllerをデプロイ

   ```bash
   $ kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.47.0/deploy/static/provider/baremetal/deploy.yaml
   ```

3. Nginx Ingress ControllerのPodがReadyになるまで待機

   ```bash
   # Nginx Ingress ControllerのPodがReadyになるまで待機
   $ kubectl wait pod -n ingress-nginx -l app.kubernetes.io/component=controller --for=condition=Ready --timeout=5m
   pod/ingress-nginx-controller-55bc4f5565-p2mh4 condition met
   
   # Nginx Ingress ControllerのPodがReadyになっていることを確認
   $ kubectl get pod -n ingress-nginx
   NAME                                        READY   STATUS      RESTARTS   AGE
   ingressnginx-admission-create-v9m2t         0/1     Completed   0          2m15s
   ingressnginx-admission-patch-ph5th          0/1     Completed   1          2m15s
   ingress-nginx-controller-55bc4f5565-p2mh4   1/1     Running     0          2m15s
   ```

### 6.2 Ingressの動作確認

今回はApacheとnginxという2種類のWebサーバをコンテナとして起動し、Ingressを用いてL7 LoadBalancingすることを想定しています。

1. Apache(httpd)をデプロイ

   ```bash
   # Apacheのマニフェストを確認
   $ curl https://raw.githubusercontent.com/senimagan/raspi-k8s-training/main/manifests/5.2/apache.yaml
   ---
   apiVersion: v1
   kind: Service
   metadata:
     name: httpd
   spec:
     ports:
     - port: 80
       protocol: TCP
       targetPort: 80
     selector:
       app: httpd
     type: ClusterIP
   ---
   apiVersion: v1
   kind: ConfigMap
   metadata:
     name: httpd-html
   data:
     index.html: |
       Welcome to Apache(httpd)!
   ---
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: httpd
   spec:
     replicas: 1
     selector:
       matchLabels:
         app: httpd
     template:
       metadata:
         labels:
           app: httpd
       spec:
         containers:
         - image: httpd:alpine
           name: httpd
           ports:
           - containerPort: 80
           volumeMounts:
           - name: contents
             mountPath: /usr/local/apache2/htdocs/httpd/
         volumes:
         - name: contents
           configMap:
             name: httpd-html
   ```

   ```bash
   $ kubectl apply -f https://raw.githubusercontent.com/senimagan/raspi-k8s-training/main/manifests/5.2/apache.yaml
   ```

2. nginxをデプロイ

   ```bash
   # nginxのマニフェストを確認
   $ curl https://raw.githubusercontent.com/senimagan/raspi-k8s-training/main/manifests/5.2/nginx.yaml
   ---
   apiVersion: v1
   kind: Service
   metadata:
     name: nginx
   spec:
     ports:
     - port: 80
       protocol: TCP
       targetPort: 80
     selector:
       app: nginx
     type: ClusterIP
   ---
   apiVersion: v1
   kind: ConfigMap
   metadata:
     name: nginx-html
   data:
     index.html: |
       Welcome to nginx!!
   ---
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: nginx
   spec:
     replicas: 1
     selector:
       matchLabels:
         app: nginx
     template:
       metadata:
         labels:
           app: nginx
       spec:
         containers:
         - image: nginx:alpine
           name: nginx
           ports:
           - containerPort: 80
           volumeMounts:
           - name: contents
             mountPath: /usr/share/nginx/html/nginx
         volumes:
         - name: contents
           configMap:
             name: nginx-html
   ```

   ```bash
   $ kubectl apply -f https://raw.githubusercontent.com/senimagan/raspi-k8s-training/main/manifests/5.2/nginx.yaml
   ```

3. Ingressを作成

   ```bash
   # Ingressのマニフェストを確認
   $ curl https://raw.githubusercontent.com/senimagan/raspi-k8s-training/main/manifests/5.2/ingress-test.yaml
   apiVersion: extensions/v1beta1
   kind: Ingress
   metadata:
     name: ingress-test
   spec:
     rules:
     - http:
         paths:
         - path: /nginx/
           backend:
             serviceName: nginx
             servicePort: 80
         - path: /httpd/
           backend:
             serviceName: httpd
             servicePort: 80
   ```

   ```bash
   $ kubectl apply -f https://raw.githubusercontent.com/senimagan/raspi-k8s-training/main/manifests/5.2/ingress-test.yaml
   ```

4. Nginx Ingress ControllerのNodePort Serviceを確認

   ```bash
   # Nginx Ingress ControllerのNodePort Serviceを確認
   $ kubectl get -n ingress-nginx svc/ingress-nginx-controller
   NAME                       TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                      AGE
   ingress-nginx-controller   NodePort    10.107.214.154   <none>        80:30431/TCP,443:30017/TCP   48m
   
   # httpのポートを環境変数に格納
   $ HTTP_PORT=$(kubectl get -n ingress-nginx svc/ingress-nginx-controller \
   -o jsonpath='{.spec.ports[?(@.name=="http")].nodePort}')
   ```

5. Apacheとnginxにアクセス
   Master, WorkerのいずれかのIPアドレス（今回は、`172.20.10.2`とする）に、手順4で取得したNodePortでアクセスする。

   ```bash
   $ curl http://172.20.10.2:${HTTP_PORT}/nginx/
   Welcome to nginx!!
   
   $ curl http://172.20.10.2:${HTTP_PORT}/httpd/
   Welcome to Apache(httpd)!
   ```

   それぞれApacheとNginxからレスポンスが返ってきており、複数のアプリを1つのNodePort Serviceで公開できていることがわかる。

   以下は今回作成したIngressのイメージ図である。

   ![Ingressのイメージ図](raspi-k8s-training-materials_r1.assets/ingress-image.png)

   まず、30431番ポートへのリクエストをNginx ingress controllerが受け取り、そのリクエストのパスとIngressに設定したルールに従って、リクエストをPodに振り分けることでL7 LoadBalancingを実現している。

<div style="page-break-before:always"></div>

## 7. k8sクラスタのメトリクス表示

### 7.1 3.5インチディスプレイの設定(Masterのみ)

本作業はMasterのみ実施する

1. gitをインストール

   ```bash
   $ sudo apt install git -y
   ```

2. ディスプレイ用のプロジェクトをclone

   ```bash
   $ git clone https://github.com/kedei/LCD_driver
   ```

   カレントディレクトリに **LCD_driver** が展開されたことを確認

   ```bash
   $ ls -l | grep LCD_driver
   drwxr-xr-x 6 tarte tarte 4096 Aug Jul 29 17:16 LCD_driver
   ```
   
3. 権限を付与

   ```bash
   $ sudo chmod -R 777 LCD_driver
   
   #権限が(drwxrwxrwx)に変更されたことを確認
   $ ls -l | grep LCD_driver
   drwxrwxrwx 6 tarte tarte 4096 Aug Jul 29 17:16 LCD_driver
   ```

4. `LCD_driver`ディレクトリに移動

   ```bash
   $ cd LCD_driver
   ```

5. LCDドライバをインストール

   ```bash
   $ ./LCD35_show
   ```

   【補足内容】 
   LCDドライバインストール後に再起動が実行されます。 
   インストール後、以下方法でHDMI接続ディスプレイ表示　<==> 3.5インチディスプレイの切替が可能ですが、両ディスプレイを同時には利用できません。  

   - 3.5インチディスプレイ表示切替

     ```bash
     $ cd ~/LCD_driver
     $ sudo ./LCD35_show
     # コマンド実行後に再起動され、3.5インチディスプレイ側で起動表示されます
     ```

   - HDMIディスプレイ表示切替

     ```bash
     $ cd ~/LCD_driver
     $ sudo ./LCD_hdmi
     # コマンド実行後に再起動され、HDMIディスプレイ側で起動表示されます
     ```

### 7.2 metrics-serverの追加

デフォルトの状態ではKubernetesクラスタのメトリクスを取得することができないため、metrics-serverをデプロイする。
metrics-serverをデプロイすることで、`kubectl top`コマンドを用いてKubernetesクラスタのメトリクスを収集できるようになる。

1. (Master) `kubectl top`が動作しないことを確認

   ```bash
   $ kubectl top node
   Erro from server (NotFound): the server could not find the requested resource (get services http:heapster:)
   ```

2. (Master) metrics-serverをclone

   ```bash
   $ git clone https://github.com/kubernetes-sigs/metrics-server.git
   ```

3. (Master) Arm用にマニフェストを変更

   `metrics-server/manifests/base/deployment.yaml`

   ```diff
   ...省略...
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: metrics-server
     ...省略...
   spec:
     ...省略...
     template:
       ...省略...
       spec:
         ...省略...
         containers:
         - name: metrics-server
           image: gcr.io/k8s-staging-metrics-server/metrics-server:master
           ...省略...
           args:
           - --cert-dir=/tmp
           - --secure-port=4443
           - --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname
           - --kubelet-use-node-status-port
   +       - --kubelet-insecure-tls
           ...
         nodeSelector:
           kubernetes.io/os: linux
   +       kubernetes.io/arch: "arm"
   ```

4. (Master) metrics-serverをデプロイ

   ```bash
   $ kubectl apply -f metrics-server/manifests/base/
   ```

5. (Master) metrics-serverが正常にデプロイされたことを確認

   ```bash
   $ kubectl get pod -n kube-system | grep metrics-server
   metrics-server-xxxxxxxxxx-yyyyy   1/1     Running   0          1m
   ```

6. (Master) `kubectl top`が機能することを確認

   ```bash
   $ kubectl top node
   NAME                 CPU(cores)   CPU%   MEMORY(bytes)   MEMORY%
   raspi-k8s-master     388m         9%     570Mi           14%
   raspi-k8s-worker01   179m         4%     320Mi           8%
   raspi-k8s-worker02   193m         4%     303Mi           7%
   ```

   以下が出力される場合は、しばらくしてから再度実行してみる

   ```bash
   $ kubectl top node
   error: metrics not available yet
   ```

### 7.3 ディスプレイにメトリクスを表示する

SamplerというOSSを用いて、Masterに接続したディスプレイにKuberntesクラスタのメトリクスを表示できるようにする。

1. (Master) プロジェクトをクローン
   @reireias氏が[sampler](https://github.com/sqshq/sampler)プロジェクトをフォークし、Arm用に改変したものを利用する。

   ```bash
   $ git clone https://github.com/reireias/sampler.git
   ```

2. (Master) Go言語をインストール

   ```bash
   $ sudo apt install golang
   ```

3. (Master) samplerをビルド

   ```bash
   $ cd ~/sampler
   $ GOOS=linux GOARCH=arm GOARM=7 go build
   ```

4. (Master) パスが通っている場所にsamplerを移動

   ```bash
   $ sudo mv ~/sampler/sampler /usr/bin
   ```

5. (Master) samplerの設定ファイルを作成

   ```bash
   $ sudo mkdir /etc/sampler
   $ sudo vi /etc/sampler/k8s.yaml
   ```

   ```yaml
   gauges:
   - title: raspi-k8s-master CPU
     position: [[0, 0], [40, 6]]
     rate-ms: 30000
     color: 10
     percent-only: true
     cur:
       sample: cat /tmp/kube-node | grep raspi-k8s-master | awk '{print $3}' | tr -d "%"
     max:
       sample: echo 100
     min:
       sample: echo 0
   - title: raspi-k8s-worker01 CPU
     position: [[0, 7], [40, 6]]
     rate-ms: 30000
     color: 13
     percent-only: true
     cur:
       sample: cat /tmp/kube-node | grep raspi-k8s-worker01 | awk '{print $3}' | tr -d "%"
     max:
       sample: echo 100
     min:
       sample: echo 0
   - title: raspi-k8s-worker02 CPU
     position: [[0, 13], [40, 6]]
     rate-ms: 30000
     color: 14
     percent-only: true
     cur:
       sample: cat /tmp/kube-node | grep raspi-k8s-worker02 | awk '{print $3}' | tr -d "%"
     max:
       sample: echo 100
     min:
       sample: echo 0
   - title: raspi-k8s-master Mem
     position: [[40, 0], [40, 6]]
     rate-ms: 30000
     color: 10
     cur:
       sample: cat /tmp/kube-node | grep raspi-k8s-master | awk '{print $4}' | tr -d "Mi"
     max:
       sample: echo 4096
     min:
       sample: echo 0
   - title: raspi-k8s-worker01 Mem
     position: [[40, 7], [40, 6]]
     rate-ms: 30000
     color: 13
     cur:
       sample: cat /tmp/kube-node | grep raspi-k8s-worker01 | awk '{print $4}' | tr -d "Mi"
     max:
       sample: echo 4096
     min:
       sample: echo 0
   - title: raspi-k8s-worker02 Mem
     position: [[40, 13], [40, 6]]
     rate-ms: 30000
     color: 14
     cur:
       sample: cat /tmp/kube-node | grep raspi-k8s-worker02 | awk '{print $4}' | tr -d "Mi"
     max:
       sample: echo 4096
     min:
       sample: echo 0
   textboxes:
   - title: Status
     position: [[0, 19], [80, 23]]
     rate-ms: 30000
     sample: >-
       kubectl top node > /tmp/kube-node;
       kubectl get all --all-namespaces > /tmp/kube-all;
       echo "Pod:$(cat /tmp/kube-all | grep pod/ | grep 'Running' | wc -l)"
       "Service:$(cat /tmp/kube-all | grep service/ | wc -l)"
       "Daemonset:$(cat /tmp/kube-all | grep daemonset.apps/ | wc -l)"
       "Statefulset:$(cat /tmp/kube-all | grep daemonset.apps/ | wc -l)"
       "Deployment:$(cat /tmp/kube-all | grep deployment.apps/ | wc -l)"
       "Replicaset:$(cat /tmp/kube-all | grep replicaset.apps/ | wc -l)";
       echo "";
       echo "Service";
       kubectl get svc --no-headers | grep -v ClusterIP | awk '{print $1, $4, $5}' | column -t;
   ```

6. (Master) `sampler`を実行し、表示を確認

   ```bash
   $ sampler -c /etc/sampler/k8s.yaml
   ```

#### （おまけ）samplerの起動時自動実行設定

1. (Master) 以下のコマンドを実行し、`~/.profile`に追記

   ```bash
   $ echo 'if [ $(tty) == "/dev/tty1" ]; then sampler -c /etc/sampler/k8s.yaml; fi' >> ~/.profile
   ```

   これでログイン時に自動でsamplerを実行してくれるようになる
   ただし、ログインは自動化されないので、以降の手順で自動ログインを有効にしていく

2. (Master) `raspi-config`を実行

   ```bash
   $ sudo raspi-config
   ```

3. `3 Boot Options`を選択
4. `B1 Desktop / CLI`を選択
5. `B2 Console Autologin`を選択
6. `<Finish>`を選択
7. 再起動の確認をされるので、`<Yes>`を選択
8. Masterに接続されているディスプレイに、samplerが表示されていることを確認
