# Swift Lambda λ
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/getstream/swift-lambda/Swift)](https://github.com/GetStream/swift-lambda/actions?query=workflow%3ASwift)
[![License](https://img.shields.io/github/license/getstream/swift-lambda)](/LICENSE)
[![Twitter](https://img.shields.io/twitter/url?url=https%3A%2F%2Fgithub.com%2FGetStream%2Fswift-lambda)](https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2Fgithub.com%2FGetStream%2Fswift-lambda)
[![Twitter Follow](https://img.shields.io/twitter/follow/getstream_io?style=social)](https://twitter.com/intent/follow?screen_name=getstream_io)

This project contains configuration files and scripts to fully automate deploying an HTTP service written in Swift to AWS in a matter of seconds using the Serverless Framework. Build with 💘 by the folks @ [Stream](https://getstream.io).

Based on samples and documentation from [swift-server/swift-aws-lambda-runtime](https://github.com/swift-server/swift-aws-lambda-runtime)

## ⚙️ Getting started

### ✅ Requirements
- [Docker](https://docs.docker.com/docker-for-mac/install/)
- [Serverless Framework](https://www.serverless.com/framework/docs/getting-started/)
- [AWS account](https://aws.amazon.com/)

### ✍️ Write your function

Write your code in [`Sources/Lambda/main.swift`](Sources/Lambda/main.swift).

### 🚀 Deploy

Deploy by running `./Scripts/deploy.sh` from this project's root folder.
