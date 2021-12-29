//
// Created by Engineering on 29/12/21.
//

import Foundation
import Cleanse
import Alamofire

struct StockbitBaseUrl: Tag {
    typealias Element = String
}

struct StockbitAPISemaphore: Tag {
    typealias Element = DispatchSemaphore
}

struct StockbitAPIQueueDispatch: Tag {
    typealias Element = DispatchQueue
}

struct NetworkingModule: Module {
    static func configure(binder: SingletonScope) {
        binder.bind(String.self)
                .tagged(with: StockbitBaseUrl.self)
                .to {
                    Constants.BASE_API_URL
                }

        binder.bind(JsonRequest.self)
                .sharedInScope()
                .to(factory: StockbitAFRequest.init)
    }
}