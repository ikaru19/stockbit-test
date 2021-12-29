//
// Created by Engineering on 29/12/21.
//

import Foundation

struct ApiDataResponseImpl<T: Codable>: ApiDataResponse {
    typealias DataResponse = T

    enum CodingKeys: String, CodingKey {
        case Message = "message"
        case HasWarning = "hasWarning"
        case Data = "Data"
    }

    var HasWarning: Bool = false
    var Message: String = ""
    var Data: T?
}

extension ApiDataResponseImpl where T: Codable {
    init(from decoder: Decoder) throws {
        print("here 25 \(decoder)")
        let container = try decoder.container(keyedBy: CodingKeys.self)

        // @formatter:off
        HasWarning = try container.decodeIfPresent(Bool.self, forKey: .HasWarning) ?? true
        Message = try container.decodeIfPresent(String.self, forKey: .Message) ?? "-"
        Data = try container.decodeIfPresent(T.self, forKey: .Data)
        // @formatter:on
    }
}

extension ApiDataResponse {
    func throwErrorFromApi() throws -> Self {
        return self
    }

    func mapToData() throws -> DataResponse {
        guard let data = Data else {
            print("here 44")
            throw ConversionError.failedToConvertData
        }
        print("here 47 \(data)")
        return data
    }
}
