//
//  NetworkService.swift
//  Mock
//
//  Created by b.belotserkovtsev on 25.07.2022.
//

import Moya

protocol NetworkServiceProtocol {
    func request<T: Codable>(_ data: RequestType, completion: @escaping (Result<T, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    func request<T: Codable>(_ data: RequestType, completion: @escaping (Result<T, Error>) -> Void) {
        let provider = MoyaProvider<RequestType>()
        provider.request(data) { result in
            do {
                switch result {
                case .success(let response):
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(T.self, from: response.data)
                    completion(.success(data))
                case .failure(let error):
                    throw error
                }
            } catch {
                completion(.failure(MockError.serverFailure))
            }
        }
    }
}
