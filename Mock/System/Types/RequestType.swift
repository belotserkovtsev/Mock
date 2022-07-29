//
//  RequestType.swift
//  Mock
//
//  Created by b.belotserkovtsev on 25.07.2022.
//

import Moya

enum RequestType {
    case some
}

extension RequestType: TargetType {
    var baseURL: URL { URL(string: "someUrl")! }

    var path: String {
        switch self {
        case .some:
            return "/somePath"
        }
    }

    var method: Moya.Method {
        switch self {
        case .some:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .some:
            return .requestPlain
        }
    }

    var headers: [String: String]? { nil }
}
