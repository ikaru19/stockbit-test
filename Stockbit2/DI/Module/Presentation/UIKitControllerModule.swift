//
// Created by Engineering on 29/12/21.
//

import Foundation
import Cleanse

struct UIKitControllerModule: Module {
    static func configure(binder: UnscopedBinder) {
        binder.bind(TopListViewController.self)
                .to {
                    TopListViewController(nibName: nil, bundle: nil, viewModel: $0)
                }
        binder.bind(NewsViewController.self)
                .to {
                    NewsViewController(nibName: nil, bundle: nil, viewModel: $0)
                }
    }
}