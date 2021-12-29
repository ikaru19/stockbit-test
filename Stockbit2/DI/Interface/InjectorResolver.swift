//
// Created by Engineering on 29/12/21.
//

import Foundation

protocol InjectorResolver: AnyObject {
    func inject(_ viewController: ViewController)
}