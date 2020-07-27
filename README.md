# Swift Lambda λ
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/getstream/swift-lambda/Swift)](https://github.com/GetStream/swift-lambda/actions?query=workflow%3ASwift)
[![License](https://img.shields.io/github/license/getstream/swift-lambda)](/LICENSE)
[![Twitter](https://img.shields.io/twitter/url?url=https%3A%2F%2Fgithub.com%2FGetStream%2Fswift-lambda)](https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2Fgithub.com%2FGetStream%2Fswift-lambda)
[![Twitter Follow](https://img.shields.io/twitter/follow/getstream_io?style=social)](https://twitter.com/intent/follow?screen_name=getstream_io)

This project is a starting point for writing an HTTP service in Swift. It contains configuration files and scripts to fully automate deploying to AWS in a matter of seconds using the Serverless Framework. It is based on samples and documentation from [swift-server/swift-aws-lambda-runtime](https://github.com/swift-server/swift-aws-lambda-runtime)

Built with 💘 by the folks @ [Stream](https://getstream.io).


<img align="right" src="https://i.imgur.com/xBHnC5P.png" width="60%" />

## ⚙️ Getting started

### ✅ Prerequisites
- [Docker](https://docs.docker.com/docker-for-mac/install/)
- [Serverless Framework](https://www.serverless.com/framework/docs/getting-started/)
- [AWS Credentials](https://www.serverless.com/framework/docs/providers/aws/guide/credentials/)

### ✍️ Write your function

Write your code in [`Sources/Lambda/main.swift`](Sources/Lambda/main.swift).

### 🚀 Deploy

Deploy by running `./Scripts/deploy.sh`.

### 🔎 Verify

Verify that your service is running by opening the output URL in your browser.

![](https://i.imgur.com/dSz1pYT.png)
