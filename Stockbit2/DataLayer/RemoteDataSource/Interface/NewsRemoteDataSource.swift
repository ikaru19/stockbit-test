//
// Created by Engineering on 30/12/21.
//

import Foundation
import RxSwift
import Alamofire

protocol NewsRemoteDataSource: AnyObject {
    func getLastestNews(category: String) -> Observable<Any>
}