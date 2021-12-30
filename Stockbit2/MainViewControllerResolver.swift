//
// Created by Engineering on 29/12/21.
//

import Foundation
import Cleanse

class MainViewControllerResolver: ViewControllerResolver {
    var topListVcProvider: Provider<TopListViewController>

    init(topListVcProvider: Provider<TopListViewController>) {
        self.topListVcProvider = topListVcProvider
    }

    func instantiateTopListViewController() -> Provider<TopListViewController> {
        topListVcProvider
    }
}