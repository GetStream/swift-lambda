import AWSLambdaEvents
import AWSLambdaRuntime
import NIO

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

Lambda.run { (context: Lambda.Context, event: APIGateway.Request, callback: @escaping (Result<APIGateway.Response, Error>) -> Void) in
    context.logger.debug("hello, api gateway!")
    
    let botId = "Agent"
    
    guard
        let bodyData = event.body?.data(using: .utf8),
        let json = try? JSONSerialization.jsonObject(with: bodyData, options: []) as? [String: Any],
        json["type"] as? String == "message.new",
        let channelType = json["channel_type"] as? String,
        let channelId = json["channel_id"] as? String,
        let message = json["message"] as? [String: Any],
        let user = message["user"] as? [String: Any],
        let userId = user["id"] as? String,
        userId != botId
    else {
        callback(.success(APIGateway.Response(statusCode: .ok, body: "nope!")))
        return
    }
    
    botReply(channelType: channelType, channelId: channelId, botId: botId) {
        callback(.success(APIGateway.Response(statusCode: .ok)))
    }
}

func botReply(channelType: String, channelId: String, botId: String, completion: @escaping () -> Void) {
    let apiKey = "[insert_your_api_key_here]"
    let jwt = "[insert_your_jwt_here]"
    
    let response = [
        "I am a bot",
        "Beep boop",
        "Having trouble?",
        "I can help"
    ].randomElement() ?? ""
    
    let url = URL(string: "https://chat-us-east-1.stream-io-api.com/channels/\(channelType)/\(channelId)/message?api_key=\(apiKey)")!
    var request = URLRequest(url: url)
    request.allHTTPHeaderFields = ["Authorization": jwt, "stream-auth-type": "jwt"]
    
    request.httpMethod = "POST"
    request.httpBody =
    """
        {
          "message" : {
              "text" : "\(response)",
              "silent" : false,
              "user_id": "\(botId)"
          }
        }
    """.data(using: .utf8)
    
    let task = URLSession.shared.dataTask(with: request) { _,_,_ in
        completion()
    }
    
    task.resume()
}
