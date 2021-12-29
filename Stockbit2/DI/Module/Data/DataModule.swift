//
// Created by Engineering on 29/12/21.
//

import Foundation
import Cleanse

struct DataModule: Module {
    static func configure(binder: SingletonScope) {
        binder.include(module: NetworkingModule.self)
        binder.include(module: StockbitAPIModule.self)
        binder.bind(TopListRemoteDataSource.self)
                .sharedInScope()
                .to { (api: StockbitJsonAPI) in
                    api
                }

    }
}