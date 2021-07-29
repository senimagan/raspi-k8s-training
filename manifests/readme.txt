manifests
 |- 5.1
 |   |- mandatory.yaml # 5.1の手順4でNginx Ingress Controllerを構築するためのマニフェスト(マニフェスト編集済み)
 |   |- ingress-nginx.yaml      # 5.1の手順5で作成・デプロイするNginx Ingress ControllerのNodePort Serviceのマニフェスト
 |
 |- 5.2
 |   |- apache.yaml             # 5.2の手順1で作成・デプロイするApacheのマニフェスト
 |   |- nginx.yaml              # 5.2の手順2で作成・デプロイするNginxのマニフェスト
 |   |- ingress-test.yaml       # 5.2の手順3で作成・デプロイするIngressのマニフェスト
 |
 |- 6.2
 |   |- metrics-server          # 6.2の手順4でmetrics-serverをデプロイするためのマニフェスト群（deployment.yamlは修正済み）
 |       |- manifests
 |           |- base
 |               |- apiservice.yaml
 |               |- deployment.yaml
 |               |- kustomization.yaml
 |               |- pdb.yaml
 |               |- rbac.yaml
 |               |- service.yaml
 |
 |- 6.3
     |- k8s.yaml                # 6.3の手順5で作成するsamplerの設定ファイル
