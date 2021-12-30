//
// Created by Engineering on 29/12/21.
//

import Foundation
import RxSwift

protocol TopListViewModelDelegate: AnyObject {
    func onFinishFetch()
}

protocol GetTopListViewModel: AnyObject {
    var errors: Observable<Error> { get }
    var topLists: Observable<[Domain.Toplist]> { get }
    var delegate: TopListViewModelDelegate? { get set }

    func refreshPage()
    func getTopLists(limit: Int)
}