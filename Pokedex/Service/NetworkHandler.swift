//
//  NetworkHandler.swift
//  Pokedex
//
//  Created by Lucas Gomesx on 01/09/22.
//

import Foundation

typealias NetworkResult<T: Decodable> = ((Result<T, NetworkError>) -> Void)

struct NetworkRequest {
    var endpointURL: String
}

enum NetworkError: Error {
    case decodeError
    case noData
    case invalidURL
    case invalidStatusCode
    case networkError
}

extension NetworkError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .decodeError:
            return "Erro no decoder"
        case .noData:
            return "Data error"
        case .invalidURL:
            return "URL Invalida"
        case .invalidStatusCode:
            return "Status Code Invalido"
        case .networkError:
            return "Erro desconhecido"
        }
    }
}
