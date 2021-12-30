//
// Created by Engineering on 29/12/21.
//

import Foundation
import Cleanse

class MainViewControllerResolver: ViewControllerResolver {
    var topListVcProvider: Provider<TopListViewController>
    var newsVcProvider: Provider<NewsViewController>

    init(
            topListVcProvider: Provider<TopListViewController>,
            newsVcProvider: Provider<NewsViewController>
        ) {
        self.topListVcProvider = topListVcProvider
        self.newsVcProvider = newsVcProvider
    }

    func instantiateTopListViewController() -> Provider<TopListViewController> {
        topListVcProvider
    }

    func instantiateNewsViewController() -> Provider<NewsViewController> {
        newsVcProvider
    }
}