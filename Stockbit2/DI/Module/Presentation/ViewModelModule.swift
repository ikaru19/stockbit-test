//
// Created by Engineering on 29/12/21.
//

import Foundation
import Cleanse

struct ViewModelModule: Module {
    static func configure(binder: UnscopedBinder) {
        binder.bind(GetTopListViewModel.self)
                .to(factory: GetTopListViewModelImpl.init)
    }
}