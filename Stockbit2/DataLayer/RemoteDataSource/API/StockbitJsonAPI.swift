//
// Created by Engineering on 29/12/21.
//

import Foundation

final class StockbitJsonAPI {
    private(set) var jsonRequestService: JsonRequest

    init(apiService: JsonRequest) {
        jsonRequestService = apiService
    }
}