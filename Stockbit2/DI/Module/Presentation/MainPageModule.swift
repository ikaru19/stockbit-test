//
// Created by Engineering on 29/12/21.
//

import Foundation
import Cleanse

struct MainPageModule: Module {
    static func configure(binder: UnscopedBinder) {
        binder.bindPropertyInjectionOf(ViewController.self)
                .to(injector: ViewController.injectProperties)
    }
}