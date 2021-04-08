//
//  HttpRequest.swift
//  Service
//
//  Created by Gustavo Henrique Frota Soares on 07/04/21.
//

import Foundation

public protocol HttpRequesting: class {
    func request<T: Decodable> (with setup: HttpRequestSetup, completionHandler: @escaping(Result<T, RequestError>) -> Void)
}


public final class HttpRequest: HttpRequesting {

    //MARK: - Variables
    private let session: URLSession

    //MARK: - Life Cycle
    public init(newSession: URLSession = URLSession.shared) {
        session = newSession
    }

    //MARK: - HttpRequesting implementation
    public func request<T>(with setup: HttpRequestSetup, completionHandler: @escaping (Result<T, RequestError>) -> Void) where T : Decodable {

        guard let url = URL(string: setup.url) else {
            completionHandler(.failure(.urlNotFound))
            return
        }

        var urlRequest = URLRequest(url: url, cachePolicy: setup.cachePolicy, timeoutInterval: setup.timeoutInterval)

        urlRequest.httpMethod = setup.httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = setup.httpHeaders

        do {
            try handle(request: &urlRequest, setup: setup)
        } catch {
            guard let error = error as? RequestError else { return }
            completionHandler(.failure(error))
            return
        }

        session.dataTask(with: urlRequest) { [weak self] (data, response, error) in

            guard let self = self else { return }

            if let error = error {
                completionHandler(.failure(.unknown(error.localizedDescription)))
                return
            }

            guard let data = data else {
                completionHandler(.failure(.brokenData))
                return 
            }

            guard let httpResponse = response as? HTTPURLResponse
            else {
                completionHandler(.failure(.invalidHttpResponse))
                return
            }
            completionHandler(self.handleHttpStatus(response: httpResponse, data: data))
        }
    }

    private func handle(request: inout URLRequest, setup: HttpRequestSetup) throws {
        if let parameters = setup.parameters, !parameters.isEmpty {

            switch setup.httpMethod {
                case .get:

                    guard var urlComponents = URLComponents(string: setup.url) else {
                        throw RequestError.urlNotFound
                    }

                    urlComponents.queryItems = []
                    for parameter in parameters {
                        urlComponents.queryItems?.append(URLQueryItem(name: parameter.key, value: parameter.value as? String))
                    }
                    request.url = urlComponents.url

                default:

                    if let body = setup.parameters {
                        do {
                            request.httpBody = try JSONSerialization.data(withJSONObject: body)
                        } catch {
                            throw RequestError.couldNotEncodeObject
                        }
                    }
                }
         }
    }

    private func handleHttpStatus<T: Decodable>(response: HTTPURLResponse, data: Data) -> Result<T, RequestError> {
        switch response.statusCode {
            case 200...299:
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .coindesk
                    let responseModel = try decoder.decode(T.self, from: data)
                    return .success(responseModel)
                } catch {
                    return .failure(.couldNotParseObject)
                }
            case 400:
                return .failure(.badRequest)
            case 403:
                return .failure(.forbidden)
            case 404:
                return .failure(.couldNotFindHost)
            case 500:
                return .failure(.internalServerError)
            default:
                return .failure(.unknown("Unexpected error."))
        }
    }
}
