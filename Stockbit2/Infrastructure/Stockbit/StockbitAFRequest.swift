//
// Created by Engineering on 29/12/21.
//

import Foundation
import Cleanse
import RxSwift
import Alamofire

final class StockbitAFRequest {
    private var baseUrl: TaggedProvider<StockbitBaseUrl>

    init(
            baseUrl: TaggedProvider<StockbitBaseUrl>
    ) {
        self.baseUrl = baseUrl
    }

    static func isNetworkConnected() -> Bool {
        if let manager = NetworkReachabilityManager() {
            return manager.isReachable
        } else {
            return false
        }
    }

    func injectBaseUrl(endPoint: String) -> String {
        "\(baseUrl.get())\(endPoint)"
    }
}