manifests
 |- 4.2
 |   |- apache-deploy.yaml         # Apacheのマニフェスト
 |
 |- 4.4
 |   |- apache.yaml                # Pod退避の時間を変更したApacheのマニフェスト
 |
 |- 4.5
 |   |- apache-clusterip.yaml      # ApacheのClusterIP Serviceのマニフェスト
 |   |- apache-nodeport.yaml       # ApacheのNodePort Serviceのマニフェスト
 |   |- apache.yaml                # Apacheのマニフェスト
 |   |- ingress-path.yaml          # ApacheとNGINXを公開するIngressのマニフェスト
 |   |- nginx-clusterip.yaml       # NGINXのClusterIP Serviceのマニフェスト
 |   |- nginx-nodeport.yaml        # NGINXのNodePort Serviceのマニフェスト
 |   |- nginx.yaml                 # NGINXのマニフェスト
 |
 |- 4.6
     |- metrics-server
     |   |- components.yaml        # metrics-serverのマニフェスト
     |
     |- resource-consumer
     |   |- consume-resources.sh   # リソースを消費させるためのシェルスクリプト
     |   |- resource-consumer.yaml # resource-consumerのマニフェスト
     |
     |- sampler
         |- k8s.yaml               # samplerの設定ファイル
         |- sampler-autoexec       # samplerを起動時自動実行するためのコマンド
