//
// Created by Engineering on 29/12/21.
//

import Foundation
import Cleanse

struct UseCaseModule: Module {
    static func configure(binder: UnscopedBinder) {
        binder.bind(GetTopListUseCase.self)
                .to(factory: GetTopListUseCaseImpl.init)
        binder.bind(GetLastestNewsUseCase.self)
                .to(factory: GetLastestNewsUseCaseImpl.init)
    }
}