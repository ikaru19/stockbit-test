//
// Created by Engineering on 29/12/21.
//

import Foundation

enum ConversionError: RuntimeError {
    case failedToConvertData

    var message: String {
        switch self {
        case .failedToConvertData: return "Failed to convert data"
        }
    }
}