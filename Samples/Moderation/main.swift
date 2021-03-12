import AWSLambdaEvents
import AWSLambdaRuntime
import NIO

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

Lambda.run { (context: Lambda.Context, event: APIGateway.Request, callback: @escaping (Result<APIGateway.Response, Error>) -> Void) in
    guard
        let data = event.body?.data(using: .utf8),
        let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
        var message = json["message"] as? [String: Any]
    else {
        callback(.success(APIGateway.Response(statusCode: .ok)))
        return
    }
    
    // rewrite message's text with redacted version
    message["text"] = redactCreditCardNumbers(from: text)
    
    let body = ["message": message]
    let bodyData = try! JSONSerialization.data(withJSONObject: body)
    let string = String(data: bodyData, encoding: .utf8)
    
    callback(.success(APIGateway.Response(statusCode: .ok, body: string)))
}

func redactCreditCardNumbers(from text: String) -> String {
    var text = text
    
    let americanExpress = "(?:3[47][0-9]{13})";
    let dinersClub = "(?:3(?:0[0-5]|[68][0-9])[0-9]{11})";
    let discover = "(?:6(?:011|5[0-9]{2})(?:[0-9]{12}))";
    let jcb = "(?:(?:2131|1800|35\\d{3})\\d{11})";
    let maestro = "(?:(?:5[0678]\\d\\d|6304|6390|67\\d\\d)\\d{8,15})";
    let mastercard = "(?:(?:5[1-5][0-9]{2}|222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720)[0-9]{12})";
    let visa = "(?:4[0-9]{12})(?:[0-9]{3})?";

    let all = [americanExpress, dinersClub, discover, jcb, maestro, mastercard, visa].joined(separator: "|")
    
    let regex = try! NSRegularExpression(pattern: all)

    let res = regex.matches(in: text, options: [], range: NSRange(location: 0, length: text.count))

    res.forEach {
        text = text.replacingCharacters(
            in: Range($0.range, in: text)!,
            with: String(repeating: "*", count: $0.range.length)
        )
    }
    
    return text
}
