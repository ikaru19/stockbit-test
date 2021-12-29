//
// Created by Engineering on 29/12/21.
//

import Foundation
import RxSwift

protocol GetTopListUseCase: AnyObject {
    func execute(limit: Int) -> Single<Domain.Toplist?>
}