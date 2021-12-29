//
// Created by Engineering on 29/12/21.
//

import Foundation

protocol ApiDataResponse: Codable {
    associatedtype DataResponse

    var Data: DataResponse? { get }
}