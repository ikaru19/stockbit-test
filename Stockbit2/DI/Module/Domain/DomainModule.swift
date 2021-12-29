//
// Created by Engineering on 29/12/21.
//

import Foundation
import Cleanse

struct DomainModule: Module {
    static func configure(binder: SingletonScope) {
        binder.include(module: UseCaseModule.self)
    }
}