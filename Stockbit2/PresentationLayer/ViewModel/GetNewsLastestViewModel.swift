//
// Created by Engineering on 30/12/21.
//

import Foundation
import RxSwift

protocol GetNewsLastestViewModel: AnyObject {
    var errors: Observable<Error> { get }
    var newsList: Observable<[Domain.News]> { get }

    func getNews(category: String)
}