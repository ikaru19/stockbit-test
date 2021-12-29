//
// Created by Engineering on 29/12/21.
//

import Foundation

extension Domain {
    struct Toplist: Codable {
        let message: String
        let type: Int
        let metaData: MetaData
        let sponsoredData: [JSONAny]
        let data: [Datum]
        let rateLimit: RateLimit
        let hasWarning: Bool

        enum CodingKeys: String, CodingKey {
            case message = "Message"
            case type = "Type"
            case metaData = "MetaData"
            case sponsoredData = "SponsoredData"
            case data = "Data"
            case rateLimit = "RateLimit"
            case hasWarning = "HasWarning"
        }
    }

// MARK: - Datum
    struct Datum: Codable {
        let coinInfo: CoinInfo
        let raw: Raw
        let display: Display

        enum CodingKeys: String, CodingKey {
            case coinInfo = "CoinInfo"
            case raw = "RAW"
            case display = "DISPLAY"
        }
    }

// MARK: - CoinInfo
    struct CoinInfo: Codable {
        let id, name, fullName, coinInfoInternal: String
        let imageURL, url, algorithm, proofType: String
        let rating: Rating
        let netHashesPerSecond: Double
        let blockNumber: Int
        let blockTime, blockReward: Double
        let assetLaunchDate: String
        let maxSupply: Double
        let type: Int
        let documentType: DocumentType

        enum CodingKeys: String, CodingKey {
            case id = "Id"
            case name = "Name"
            case fullName = "FullName"
            case coinInfoInternal = "Internal"
            case imageURL = "ImageUrl"
            case url = "Url"
            case algorithm = "Algorithm"
            case proofType = "ProofType"
            case rating = "Rating"
            case netHashesPerSecond = "NetHashesPerSecond"
            case blockNumber = "BlockNumber"
            case blockTime = "BlockTime"
            case blockReward = "BlockReward"
            case assetLaunchDate = "AssetLaunchDate"
            case maxSupply = "MaxSupply"
            case type = "Type"
            case documentType = "DocumentType"
        }
    }

    enum DocumentType: String, Codable {
        case webpagecoinp = "Webpagecoinp"
    }

// MARK: - Rating
    struct Rating: Codable {
        let weiss: Weiss

        enum CodingKeys: String, CodingKey {
            case weiss = "Weiss"
        }
    }

// MARK: - Weiss
    struct Weiss: Codable {
        let rating, technologyAdoptionRating, marketPerformanceRating: String

        enum CodingKeys: String, CodingKey {
            case rating = "Rating"
            case technologyAdoptionRating = "TechnologyAdoptionRating"
            case marketPerformanceRating = "MarketPerformanceRating"
        }
    }

// MARK: - Display
    struct Display: Codable {
        let usd: DisplayUsd

        enum CodingKeys: String, CodingKey {
            case usd = "USD"
        }
    }

// MARK: - DisplayUsd
    struct DisplayUsd: Codable {
        let fromsymbol: String
        let tosymbol: PurpleTOSYMBOL
        let market: PurpleMARKET
        let price: String
        let lastupdate: Lastupdate
        let lastvolume, lastvolumeto, lasttradeid, volumeday: String
        let volumedayto, volume24Hour, volume24Hourto, openday: String
        let highday, lowday, open24Hour, high24Hour: String
        let low24Hour, lastmarket, volumehour, volumehourto: String
        let openhour, highhour, lowhour, toptiervolume24Hour: String
        let toptiervolume24Hourto, change24Hour, changepct24Hour, changeday: String
        let changepctday, changehour, changepcthour: String
        let conversiontype: Conversiontype
        let conversionsymbol, supply, mktcap: String
        let mktcappenalty: Mktcappenalty
        let circulatingsupply, circulatingsupplymktcap, totalvolume24H, totalvolume24Hto: String
        let totaltoptiervolume24H, totaltoptiervolume24Hto, imageurl: String

        enum CodingKeys: String, CodingKey {
            case fromsymbol = "FROMSYMBOL"
            case tosymbol = "TOSYMBOL"
            case market = "MARKET"
            case price = "PRICE"
            case lastupdate = "LASTUPDATE"
            case lastvolume = "LASTVOLUME"
            case lastvolumeto = "LASTVOLUMETO"
            case lasttradeid = "LASTTRADEID"
            case volumeday = "VOLUMEDAY"
            case volumedayto = "VOLUMEDAYTO"
            case volume24Hour = "VOLUME24HOUR"
            case volume24Hourto = "VOLUME24HOURTO"
            case openday = "OPENDAY"
            case highday = "HIGHDAY"
            case lowday = "LOWDAY"
            case open24Hour = "OPEN24HOUR"
            case high24Hour = "HIGH24HOUR"
            case low24Hour = "LOW24HOUR"
            case lastmarket = "LASTMARKET"
            case volumehour = "VOLUMEHOUR"
            case volumehourto = "VOLUMEHOURTO"
            case openhour = "OPENHOUR"
            case highhour = "HIGHHOUR"
            case lowhour = "LOWHOUR"
            case toptiervolume24Hour = "TOPTIERVOLUME24HOUR"
            case toptiervolume24Hourto = "TOPTIERVOLUME24HOURTO"
            case change24Hour = "CHANGE24HOUR"
            case changepct24Hour = "CHANGEPCT24HOUR"
            case changeday = "CHANGEDAY"
            case changepctday = "CHANGEPCTDAY"
            case changehour = "CHANGEHOUR"
            case changepcthour = "CHANGEPCTHOUR"
            case conversiontype = "CONVERSIONTYPE"
            case conversionsymbol = "CONVERSIONSYMBOL"
            case supply = "SUPPLY"
            case mktcap = "MKTCAP"
            case mktcappenalty = "MKTCAPPENALTY"
            case circulatingsupply = "CIRCULATINGSUPPLY"
            case circulatingsupplymktcap = "CIRCULATINGSUPPLYMKTCAP"
            case totalvolume24H = "TOTALVOLUME24H"
            case totalvolume24Hto = "TOTALVOLUME24HTO"
            case totaltoptiervolume24H = "TOTALTOPTIERVOLUME24H"
            case totaltoptiervolume24Hto = "TOTALTOPTIERVOLUME24HTO"
            case imageurl = "IMAGEURL"
        }
    }

    enum Conversiontype: String, Codable {
        case direct = "direct"
    }

    enum Lastupdate: String, Codable {
        case justNow = "Just now"
        case the1MinAgo = "1 min ago"
    }

    enum PurpleMARKET: String, Codable {
        case cryptoCompareIndex = "CryptoCompare Index"
    }

    enum Mktcappenalty: String, Codable {
        case the0 = "0 %"
    }

    enum PurpleTOSYMBOL: String, Codable {
        case empty = "$"
    }

// MARK: - Raw
    struct Raw: Codable {
        let usd: RawUsd

        enum CodingKeys: String, CodingKey {
            case usd = "USD"
        }
    }

// MARK: - RawUsd
    struct RawUsd: Codable {
        let type: String
        let market: FluffyMARKET
        let fromsymbol: String
        let tosymbol: FluffyTOSYMBOL
        let flags: String
        let price: Double
        let lastupdate: Int
        let median, lastvolume, lastvolumeto: Double
        let lasttradeid: String
        let volumeday, volumedayto, volume24Hour, volume24Hourto: Double
        let openday, highday, lowday, open24Hour: Double
        let high24Hour, low24Hour: Double
        let lastmarket: String
        let volumehour, volumehourto, openhour, highhour: Double
        let lowhour, toptiervolume24Hour, toptiervolume24Hourto, change24Hour: Double
        let changepct24Hour, changeday, changepctday, changehour: Double
        let changepcthour: Double
        let conversiontype: Conversiontype
        let conversionsymbol: String
        let supply, mktcap: Double
        let mktcappenalty: Int
        let circulatingsupply, circulatingsupplymktcap, totalvolume24H, totalvolume24Hto: Double
        let totaltoptiervolume24H, totaltoptiervolume24Hto: Double
        let imageurl: String

        enum CodingKeys: String, CodingKey {
            case type = "TYPE"
            case market = "MARKET"
            case fromsymbol = "FROMSYMBOL"
            case tosymbol = "TOSYMBOL"
            case flags = "FLAGS"
            case price = "PRICE"
            case lastupdate = "LASTUPDATE"
            case median = "MEDIAN"
            case lastvolume = "LASTVOLUME"
            case lastvolumeto = "LASTVOLUMETO"
            case lasttradeid = "LASTTRADEID"
            case volumeday = "VOLUMEDAY"
            case volumedayto = "VOLUMEDAYTO"
            case volume24Hour = "VOLUME24HOUR"
            case volume24Hourto = "VOLUME24HOURTO"
            case openday = "OPENDAY"
            case highday = "HIGHDAY"
            case lowday = "LOWDAY"
            case open24Hour = "OPEN24HOUR"
            case high24Hour = "HIGH24HOUR"
            case low24Hour = "LOW24HOUR"
            case lastmarket = "LASTMARKET"
            case volumehour = "VOLUMEHOUR"
            case volumehourto = "VOLUMEHOURTO"
            case openhour = "OPENHOUR"
            case highhour = "HIGHHOUR"
            case lowhour = "LOWHOUR"
            case toptiervolume24Hour = "TOPTIERVOLUME24HOUR"
            case toptiervolume24Hourto = "TOPTIERVOLUME24HOURTO"
            case change24Hour = "CHANGE24HOUR"
            case changepct24Hour = "CHANGEPCT24HOUR"
            case changeday = "CHANGEDAY"
            case changepctday = "CHANGEPCTDAY"
            case changehour = "CHANGEHOUR"
            case changepcthour = "CHANGEPCTHOUR"
            case conversiontype = "CONVERSIONTYPE"
            case conversionsymbol = "CONVERSIONSYMBOL"
            case supply = "SUPPLY"
            case mktcap = "MKTCAP"
            case mktcappenalty = "MKTCAPPENALTY"
            case circulatingsupply = "CIRCULATINGSUPPLY"
            case circulatingsupplymktcap = "CIRCULATINGSUPPLYMKTCAP"
            case totalvolume24H = "TOTALVOLUME24H"
            case totalvolume24Hto = "TOTALVOLUME24HTO"
            case totaltoptiervolume24H = "TOTALTOPTIERVOLUME24H"
            case totaltoptiervolume24Hto = "TOTALTOPTIERVOLUME24HTO"
            case imageurl = "IMAGEURL"
        }
    }

    enum FluffyMARKET: String, Codable {
        case cccagg = "CCCAGG"
    }

    enum FluffyTOSYMBOL: String, Codable {
        case usd = "USD"
    }

// MARK: - MetaData
    struct MetaData: Codable {
        let count: Int

        enum CodingKeys: String, CodingKey {
            case count = "Count"
        }
    }

// MARK: - RateLimit
    struct RateLimit: Codable {
    }

// MARK: - Encode/decode helpers

    class JSONNull: Codable, Hashable {

        public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
        }

        public var hashValue: Int {
            return 0
        }

        public init() {}

        public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
        }
    }

    class JSONCodingKey: CodingKey {
        let key: String

        required init?(intValue: Int) {
            return nil
        }

        required init?(stringValue: String) {
            key = stringValue
        }

        var intValue: Int? {
            return nil
        }

        var stringValue: String {
            return key
        }
    }

    class JSONAny: Codable {

        let value: Any

        static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
            let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
            return DecodingError.typeMismatch(JSONAny.self, context)
        }

        static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
            let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
            return EncodingError.invalidValue(value, context)
        }

        static func decode(from container: SingleValueDecodingContainer) throws -> Any {
            if let value = try? container.decode(Bool.self) {
                return value
            }
            if let value = try? container.decode(Int64.self) {
                return value
            }
            if let value = try? container.decode(Double.self) {
                return value
            }
            if let value = try? container.decode(String.self) {
                return value
            }
            if container.decodeNil() {
                return JSONNull()
            }
            throw decodingError(forCodingPath: container.codingPath)
        }

        static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
            if let value = try? container.decode(Bool.self) {
                return value
            }
            if let value = try? container.decode(Int64.self) {
                return value
            }
            if let value = try? container.decode(Double.self) {
                return value
            }
            if let value = try? container.decode(String.self) {
                return value
            }
            if let value = try? container.decodeNil() {
                if value {
                    return JSONNull()
                }
            }
            if var container = try? container.nestedUnkeyedContainer() {
                return try decodeArray(from: &container)
            }
            if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
                return try decodeDictionary(from: &container)
            }
            throw decodingError(forCodingPath: container.codingPath)
        }

        static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
            if let value = try? container.decode(Bool.self, forKey: key) {
                return value
            }
            if let value = try? container.decode(Int64.self, forKey: key) {
                return value
            }
            if let value = try? container.decode(Double.self, forKey: key) {
                return value
            }
            if let value = try? container.decode(String.self, forKey: key) {
                return value
            }
            if let value = try? container.decodeNil(forKey: key) {
                if value {
                    return JSONNull()
                }
            }
            if var container = try? container.nestedUnkeyedContainer(forKey: key) {
                return try decodeArray(from: &container)
            }
            if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
                return try decodeDictionary(from: &container)
            }
            throw decodingError(forCodingPath: container.codingPath)
        }

        static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
            var arr: [Any] = []
            while !container.isAtEnd {
                let value = try decode(from: &container)
                arr.append(value)
            }
            return arr
        }

        static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
            var dict = [String: Any]()
            for key in container.allKeys {
                let value = try decode(from: &container, forKey: key)
                dict[key.stringValue] = value
            }
            return dict
        }

        static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
            for value in array {
                if let value = value as? Bool {
                    try container.encode(value)
                } else if let value = value as? Int64 {
                    try container.encode(value)
                } else if let value = value as? Double {
                    try container.encode(value)
                } else if let value = value as? String {
                    try container.encode(value)
                } else if value is JSONNull {
                    try container.encodeNil()
                } else if let value = value as? [Any] {
                    var container = container.nestedUnkeyedContainer()
                    try encode(to: &container, array: value)
                } else if let value = value as? [String: Any] {
                    var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                    try encode(to: &container, dictionary: value)
                } else {
                    throw encodingError(forValue: value, codingPath: container.codingPath)
                }
            }
        }

        static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
            for (key, value) in dictionary {
                let key = JSONCodingKey(stringValue: key)!
                if let value = value as? Bool {
                    try container.encode(value, forKey: key)
                } else if let value = value as? Int64 {
                    try container.encode(value, forKey: key)
                } else if let value = value as? Double {
                    try container.encode(value, forKey: key)
                } else if let value = value as? String {
                    try container.encode(value, forKey: key)
                } else if value is JSONNull {
                    try container.encodeNil(forKey: key)
                } else if let value = value as? [Any] {
                    var container = container.nestedUnkeyedContainer(forKey: key)
                    try encode(to: &container, array: value)
                } else if let value = value as? [String: Any] {
                    var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                    try encode(to: &container, dictionary: value)
                } else {
                    throw encodingError(forValue: value, codingPath: container.codingPath)
                }
            }
        }

        static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }

        public required init(from decoder: Decoder) throws {
            if var arrayContainer = try? decoder.unkeyedContainer() {
                self.value = try JSONAny.decodeArray(from: &arrayContainer)
            } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
                self.value = try JSONAny.decodeDictionary(from: &container)
            } else {
                let container = try decoder.singleValueContainer()
                self.value = try JSONAny.decode(from: container)
            }
        }

        public func encode(to encoder: Encoder) throws {
            if let arr = self.value as? [Any] {
                var container = encoder.unkeyedContainer()
                try JSONAny.encode(to: &container, array: arr)
            } else if let dict = self.value as? [String: Any] {
                var container = encoder.container(keyedBy: JSONCodingKey.self)
                try JSONAny.encode(to: &container, dictionary: dict)
            } else {
                var container = encoder.singleValueContainer()
                try JSONAny.encode(to: &container, value: self.value)
            }
        }
    }

}