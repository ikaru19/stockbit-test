//
// Created by Engineering on 29/12/21.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire

extension StockbitAFRequest: JsonRequest {
    func get(
            to endPoint: String,
            param: [String: Any],
            header: [String: String]
    ) -> Observable<Any> {
        let endPoint = injectBaseUrl(endPoint: endPoint)
        let decoder = JSONDecoder()
        print("here 18 \(param)")
        return RxAlamofire.json(
                        .get,
                        endPoint,
                        parameters: param,
                        encoding: URLEncoding.default,
                        headers: HTTPHeaders(header)
                )
    }
}