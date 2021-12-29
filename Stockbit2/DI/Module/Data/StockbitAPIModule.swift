//
// Created by Engineering on 29/12/21.
//

import Foundation
import Cleanse

struct StockbitAPIModule: Module {
    static func configure(binder: SingletonScope) {
        binder.bind()
                .sharedInScope()
                .to(factory: StockbitJsonAPI.init)
    }
}