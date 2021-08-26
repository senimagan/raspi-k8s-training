# 物理層の各種手順



[toc]

## Raspberry Piラックの組み立て手順

1. Raspberry Pi と 積層ケースを開封

   <img src="raspi-k8s-training-materials_r1.assets/image-20210825181853682.png" alt="image-20210825181853682" style="zoom: 67%;" />

2. Raspberry Piにヒートシンクを取付

   **既にRaspberry Piにヒートシンクが取り付けられている場合は次の手順に移行してください**

   ヒートシンクは積層ケースに付属している方を使用します。Raspberry Piに付属しているヒートシンクは使用しません。

   積層ケースに付属しているヒートシンクには3種類の大きさがあるので、Raspberry Pi 1台につきそれぞれ1つずつ使用します。

   <img src="raspi-k8s-training-materials_r1.assets/image-20210825183321352.png" alt="image-20210825183321352" style="zoom: 67%;" />

   ヒートシンクは裏面が両面テープのようになっています。それぞれ以下のように取り付けてください。

   <img src="raspi-k8s-training-materials_r1.assets/image-20210825183522104.png" alt="image-20210825183522104" style="zoom:67%;" />

   3台分取り付けたら、次の手順に進みます。

3. 積層ケースの下準備

   積層ケースの箱からアクリル板を取り出してください。

   <img src="assemble-raspi-rack.assets/image-20210825184517294.png" alt="image-20210825184517294" style="zoom:67%;" />

   **アクリル板が透明に見える場合は次の手順に移行してください。**

   アクリル板が白く濁っているように見える場合は、両面に保護フィルムが貼られているので剥がしてください。

   保護フィルムは極めて剥がしにくいので注意してください。積層ケースに付属しているプラスドライバでアクリル板の端の保護フィルムを少しひっかくと多少は剥がしやすくなります。

   <img src="assemble-raspi-rack.assets/image-20210825185813198.png" alt="image-20210825185813198" style="zoom:67%;" />

   保護フィルムは両面とも剥がしてください。すべて剥がし終えると、以下のように透明な状態になります。

   <img src="assemble-raspi-rack.assets/image-20210825190342234.png" alt="image-20210825190342234" style="zoom:67%;" />

4. アクリル板にRaspberry Piを取付

   1段ごとにRaspberry Pi 1台、アクリル板1枚、ネジとナットが入った小袋1つが必要になります。

   <img src="assemble-raspi-rack.assets/image-20210825190817435.png" alt="image-20210825190817435" style="zoom:67%;" />

   [ネジ] > [アクリル板] > [スペーサー] > [Raspberry Pi] > [ナット]となるように取り付けていきます。

   まず、[ネジ] > [アクリル板] > [スペーサー] となる部分まで組み立てます。

   <img src="assemble-raspi-rack.assets/image-20210825192120772.png" alt="image-20210825192120772" style="zoom: 60%;" />

   その上からRaspberry Piを置くように取り付けます。

   <img src="assemble-raspi-rack.assets/image-20210825192205254.png" alt="image-20210825192205254" style="zoom:60%;" />

   最後にナットを締めます。Raspberry Piを固定できればいいので力を入れて締める必要はありません。がたつかなければOKです。

   <img src="assemble-raspi-rack.assets/image-20210825192531219.png" alt="image-20210825192531219" style="zoom:60%;" />

   3台ともアクリル板に取付が済んだら、積み上げていきます。

   <img src="assemble-raspi-rack.assets/image-20210825192801634.png" alt="image-20210825192801634" style="zoom:60%;" />

5. 最下段を組み立てる

   先ほど組み立てた1段、脚用ネジ（短）4つ、柱用ネジ（長）4つを用意します。

   <img src="assemble-raspi-rack.assets/image-20210825193200766.png" alt="image-20210825193200766" style="zoom:60%;" />

   四隅の穴に脚用ネジを通し、柱用ネジで固定します。

   <img src="assemble-raspi-rack.assets/image-20210825193510543.png" alt="image-20210825193510543" style="zoom:60%;" />

6. 同様の手順で2段目、3段目を組み立てる

   <img src="assemble-raspi-rack.assets/image-20210825194215258.png" alt="image-20210825194215258" style="zoom:60%;" />

   <img src="assemble-raspi-rack.assets/image-20210825194311969.png" alt="image-20210825194311969" style="zoom:60%;" />

   3段目にはドーム状のナットを取り付けます。

   <img src="assemble-raspi-rack.assets/image-20210825194649043.png" alt="image-20210825194649043" style="zoom:60%;" />

以上で、Raspberry Piラックの組み立て方は完了です。



## 電源ケーブルとHDMIケーブルの接続

<img src="assemble-raspi-rack.assets/image-20210825200030074.png" alt="image-20210825200030074" style="zoom:60%;" />



## microSDカードの接続

microSDカードは以下の向きに接続してください。

![image-20210825202140559](assemble-raspi-rack.assets/image-20210825202140559.png)



## 小型ディスプレイの接続

右側の端子が右端の4本のピンに刺さるように接続します。

<img src="assemble-raspi-rack.assets/image-20210825202836076.png" alt="image-20210825202836076" style="zoom: 60%;" />

端子は奥まで差し込んでください。

<img src="assemble-raspi-rack.assets/image-20210825203016765.png" alt="image-20210825203016765" style="zoom: 60%;" />

また、小型ディスプレイには極めて小さいON/OFFスイッチがあります。
これがONになっていることを確認してください。

<img src="assemble-raspi-rack.assets/image-20210825204426623.png" alt="image-20210825204426623" style="zoom:60%;" />

小型ディスプレイが正しく接続され、スイッチがONになっている状態でRaspberry Piに電源を供給すると以下のように画面全体が白く発光します。

<img src="assemble-raspi-rack.assets/image-20210825204656547.png" alt="image-20210825204656547" style="zoom: 60%;" />

以下のように画面が発行せず暗いままの場合は、接続に誤りがあるかスイッチがOFFになっているので確認しましょう。

<img src="assemble-raspi-rack.assets/image-20210825204948892.png" alt="image-20210825204948892" style="zoom:60%;" />