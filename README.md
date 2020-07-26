# Swift Lambda λ
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/getstream/swift-lambda/Swift)](https://github.com/GetStream/swift-lambda/actions?query=workflow%3ASwift)
[![License](https://img.shields.io/github/license/getstream/swift-lambda)](/LICENSE)
[![Twitter](https://img.shields.io/twitter/url?url=https%3A%2F%2Fgithub.com%2FGetStream%2Fswift-lambda)](https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2Fgithub.com%2FGetStream%2Fswift-lambda)
[![Twitter Follow](https://img.shields.io/twitter/follow/getstream_io?style=social)](https://twitter.com/intent/follow?screen_name=getstream_io)

This repo contains configuration files and scripts to fully automate the process of deploying an HTTP service written in Swift to AWS in a matter of seconds using the Serverless Framework. Made with 💘 by the folks @ [Stream](https://getstream.io).

## ⚙️ Getting started

### ✅ Requirements
- [AWS account](https://aws.amazon.com/)
- [Install Serverless Framework](https://www.serverless.com/framework/docs/getting-started/)

### ✍️ Write your function

Write your code in [`Sources/Lambda/main.swift`](Sources/Lambda/main.swift).

### 🚀 Deploy

To deploy, run `./Scripts/deploy.sh` in the root folder.
