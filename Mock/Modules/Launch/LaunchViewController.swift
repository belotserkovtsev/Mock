//
//  LaunchViewController.swift
//  Mock
//
//  Created by b.belotserkovtsev on 25.07.2022.
//

import UIKit
import SnapKit

class LaunchViewController : UIViewController {

	private let greatingText: UILabel = {
		let view = UILabel()
		view.text = "Welcome!"
		view.font = UIFont.boldSystemFont(ofSize: 32)
		view.textColor = .black
		return view
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
        view.backgroundColor = .mock.background
		setupView()
		
	}
	
	private func setupView() {
		view.addSubview(greatingText)
		
		greatingText.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.centerY.equalToSuperview()
		}
	}
}
