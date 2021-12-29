//
// Created by Engineering on 29/12/21.
//

import Foundation
import RxSwift
import Alamofire

extension StockbitJsonAPI: TopListRemoteDataSource {
    func getTopListRemoteDataSource(limit: Int) -> Observable<Any> {
        let endpoint = "top/totaltoptiervolfull"
        let param : [String:String] = [
            "limit" : "\(limit)",
            "tsym" : "USD"
        ]

        print("here Data 12")
        return jsonRequestService
                .get(
                        to: endpoint,
                        param: param,
                        header: [:]
                )
    }
}