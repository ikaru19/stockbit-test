//
// Created by Engineering on 29/12/21.
//

import Foundation
import RxSwift

protocol GetTopListViewModel: AnyObject {
    var errors: Observable<Error> { get }
    var topLists: Observable<[Domain.Toplist]> { get }

    func refreshPage()
    func getTopLists(limit: Int)
}