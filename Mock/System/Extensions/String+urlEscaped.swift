//
//  String+urlEscaped.swift
//  Mock
//
//  Created by b.belotserkovtsev on 25.07.2022.
//

import Foundation

extension String {
    var urlEscaped: String {
        addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data { Data(self.utf8) }
}
