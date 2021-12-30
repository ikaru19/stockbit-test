//
// Created by Engineering on 30/12/21.
//

import Foundation
import RxSwift

protocol GetLastestNewsUseCase: AnyObject {
    func execute(category: String) -> Single<[Domain.News]>
}