//
// Created by Engineering on 29/12/21.
//

import Foundation

protocol RuntimeError: Error {
    var message: String { get }
}