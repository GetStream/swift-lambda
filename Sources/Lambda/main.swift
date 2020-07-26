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
