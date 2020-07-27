# Swift Lambda λ
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/getstream/swift-lambda/Swift)](https://github.com/GetStream/swift-lambda/actions?query=workflow%3ASwift)
[![License](https://img.shields.io/github/license/getstream/swift-lambda)](/LICENSE)
[![Twitter](https://img.shields.io/twitter/url?url=https%3A%2F%2Fgithub.com%2FGetStream%2Fswift-lambda)](https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2Fgithub.com%2FGetStream%2Fswift-lambda)
[![Twitter Follow](https://img.shields.io/twitter/follow/getstream_io?style=social)](https://twitter.com/intent/follow?screen_name=getstream_io)

This project is a starting point for writing an HTTP service in Swift. It contains configuration files and scripts to fully automate deploying to AWS in a matter of seconds using the Serverless Framework. It is based on samples and documentation from [swift-server/swift-aws-lambda-runtime](https://github.com/swift-server/swift-aws-lambda-runtime)

<img align="right" src="https://i.imgur.com/dSz1pYT.png" width="55%" />
<img align="right" src="https://i.imgur.com/FocTSMk.png" width="55%" />

Built with 💘 by the folks @ [Stream](https://getstream.io).

## ⚙️ Getting started

### ✅ Prerequisites
- [Docker](https://docs.docker.com/docker-for-mac/install/)
- [Serverless Framework](https://www.serverless.com/framework/docs/getting-started/)
- [AWS Credentials](https://www.serverless.com/framework/docs/providers/aws/guide/credentials/)

### ✍️ Write your function

Write your code in [`Sources/Lambda/main.swift`](Sources/Lambda/main.swift).

### 🚀 Deploy

Run `./Scripts/deploy.sh`.

### 🔎 Verify

Open the output URL in your browser.

And done!

<hr />

## 👩‍💻 Developing

There is some code already present in the `Sources/Lambda/main.swift` file. It simply outputs "Hello, world!" in plain text.

```swift
import AWSLambdaEvents
import AWSLambdaRuntime
import NIO

// MARK: - Run Lambda
Lambda.run(APIGatewayProxyLambda())

// MARK: - Handler, Request and Response
// FIXME: Use proper Event abstractions once added to AWSLambdaRuntime
struct APIGatewayProxyLambda: EventLoopLambdaHandler {
    public typealias In = APIGateway.Request
    public typealias Out = APIGateway.Response

    public func handle(context: Lambda.Context, event: APIGateway.Request) -> EventLoopFuture<APIGateway.Response> {
        context.logger.debug("hello, api gateway!")
        return context.eventLoop.makeSucceededFuture(APIGateway.Response(statusCode: .ok, body: "Hello, world!"))
    }
}
```

If you want to output some HTML, just set the "Content-Type" header to "text/html; charset=UTF-8"

```swift
...
return context.eventLoop.makeSucceededFuture(APIGateway.Response(
    statusCode: .ok,
    headers: ["Content-Type": "text/html; charset=UTF-8"],
    body: """
          <p align="center">
            <h2 align="center"> Hello, world! From Swift 5.2 💘 </h2>
          </p>
          <hl/>
          <p align="center">\(event.requestContext.identity.userAgent ?? "")</p>
          """)
)
...
```

![](https://i.imgur.com/CBWG1vG.png)

For more information on the available settings and methods, refer to the [Swift AWS Lambda Runtime README](https://github.com/swift-server/swift-aws-lambda-runtime)

## 📡 Endpoint Settings

To change some characteristics of your HTTP endpoint, such as the method expected, you should modify the [`serverless.yml`](https://github.com/GetStream/swift-lambda/blob/main/serverless.yml#L70-L72) file. For more information on the available parameters, refer to the [Serverless.yml Reference](https://www.serverless.com/framework/docs/providers/aws/guide/serverless.yml/)

## Contributing

If you have a suggestion or bug report, please [file an issue in the Swift Lambda repository](https://github.com/GetStream/swift-lambda/issues/new). If you want to take a stab at contributing code, don't hesitate in submitting a PR.  Don't forget to leave a star if you liked it :)
