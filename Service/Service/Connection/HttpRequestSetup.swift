//
//  HttpRequestSetup.swift
//  Service
//
//  Created by Gustavo Henrique Frota Soares on 07/04/21.
//

import Foundation


public enum HttpRequestMethod: String {
    case connect = "CONNECT"
    case delete = "DELETE"
    case get = "GET"
    case head = "HEAD"
    case options = "OPTIONS"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
    case trace = "TRACE"
}

public protocol HttpRequestSetup {
    var url: String { get }
    var cachePolicy: URLRequest.CachePolicy { get }
    var timeInterval: TimeInterval { get }
    var httpMethod: HttpRequestMethod { get }
    var httpHeaders: [String : String]? { get }
    var parameters: [String : Encodable]? { get }
}

extension HttpRequestSetup {
    public var cachePolicy: URLRequest.CachePolicy { return .reloadIgnoringLocalAndRemoteCacheData }
    public var timeoutInterval: TimeInterval { return 3 }
    public var httpHeaders: [String: String]? { return nil }
}


extension JSONDecoder.DateDecodingStrategy {
    static let coindesk = custom { decoder throws -> Date in
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd"
        if let date = formatter.date(from: string) {
            return date
        }
        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date: \(string)")
    }
}

