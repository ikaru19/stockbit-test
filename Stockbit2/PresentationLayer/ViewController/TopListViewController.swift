//
// Created by Engineering on 29/12/21.
//

import Foundation
import UIKit

class TopListViewController: UIViewController {
    var viewmodel: Int?

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, viewModel: Int) {
        self.viewmodel = viewModel
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}