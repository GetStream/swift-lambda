import AWSLambdaEvents
import AWSLambdaRuntime
import SwiftJWT
import Foundation

Lambda.run { (context: Lambda.Context, event: APIGateway.Request, callback: @escaping (Result<APIGateway.Response, Error>) -> Void) in
    guard
        let bodyData = event.body?.data(using: .utf8),
        let json = try? JSONSerialization.jsonObject(with: bodyData, options: []) as? [String: Any],
        let userId = json["user_id"] as? String
    else {
        callback(.success(APIGateway.Response(statusCode: .badRequest)))
        return
    }
    
    if let jwt = try? generateJWT(for: userId) {
        callback(.success(APIGateway.Response(statusCode: .ok, body: jwt)))
    } else {
        callback(.success(.init(statusCode: .internalServerError)))
    }
}

func generateJWT(for userId: String) throws -> String {
    struct ClientClaims: Claims {
        let user_id: String
    }
    
    let claims = ClientClaims(user_id: userId)

    var jwt = JWT(claims: claims)
    
    let key = "[replace_your_api_key_here]"
    let keyData = key.data(using: .utf8)!
    
    let signer = JWTSigner.hs256(key: keyData)
    
    return try jwt.sign(using: signer)
}
