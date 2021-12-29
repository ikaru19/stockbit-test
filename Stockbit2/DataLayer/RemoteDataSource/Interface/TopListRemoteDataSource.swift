//
// Created by Engineering on 29/12/21.
//

import Foundation
import RxSwift
import Alamofire

protocol TopListRemoteDataSource: AnyObject {
    func getTopListRemoteDataSource(limit: Int) -> Observable<Any>
}