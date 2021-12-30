//
// Created by Engineering on 29/12/21.
//

import Foundation
import Cleanse

protocol ViewControllerResolver: AnyObject {
    func instantiateTopListViewController() -> Provider<TopListViewController>
    func instantiateNewsViewController() -> Provider<NewsViewController>
}