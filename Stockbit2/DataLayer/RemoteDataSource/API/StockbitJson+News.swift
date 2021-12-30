//
// Created by Engineering on 30/12/21.
//

import Foundation
import RxSwift
import Alamofire
import RxAlamofire

extension StockbitJsonAPI: NewsRemoteDataSource {
    func getLastestNews(category: String) -> Observable<Any> {
        let endpoint = "v2/news/"
        let param : [String:String] = [
            "lang" : "EN",
            "categories": category
        ]

        return jsonRequestService
                .get(
                to: endpoint,
                param: param,
                header: [:]
        )
    }
}