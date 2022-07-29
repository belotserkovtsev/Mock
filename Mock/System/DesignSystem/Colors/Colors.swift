//
//  Color.swift
//  Mock
//
//  Created by b.belotserkovtsev on 25.07.2022.
//

import Foundation
import UIKit

extension UIColor {
    struct MockColors {
		let background = UIColor(named: "baseBackground")!
    }

    static var mock: MockColors { MockColors() }
}
