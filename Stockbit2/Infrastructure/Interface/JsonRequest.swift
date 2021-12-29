//
// Created by Engineering on 29/12/21.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire

protocol JsonRequest: AnyObject {
    func get(
            to endPoint: String,
            param: [String: Any],
            header: [String: String]
    ) -> Observable<Any>
}