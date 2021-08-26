# README

このマニフェストは、以下のURLのファイルを編集したものである。
https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.5.0/components.yaml

デフォルトの状態だと、自己署名証明書を使用しているクラスタでは動作しないため、
`metrics-server` Deployment の `.spec.template.spec.containers[0].args` に `--kubelet-insecure-tls` というオプションを追加している。
