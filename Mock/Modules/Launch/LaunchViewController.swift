//
//  LaunchViewController.swift
//  Mock
//
//  Created by b.belotserkovtsev on 25.07.2022.
//

import UIKit
import SnapKit

protocol LaunchViewInput: AnyObject {
    
}

final class LaunchViewController: UIViewController {

    private var output: LaunchViewOutput?

	private let greatingText: UILabel = {
		let view = UILabel()
		view.text = "Welcome!"
		view.font = UIFont.boldSystemFont(ofSize: 32)
		view.textColor = .black
		return view
	}()

    // MARK: Lifecycle

    init(
        output: LaunchViewOutput?
    ) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("Cannot init vc")
    }
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()

        output?.viewDidLoadEvent()
	}

    // MARK: Private

	private func setupView() {
        view.backgroundColor = .mock.background
		view.addSubview(greatingText)
		
		greatingText.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.centerY.equalToSuperview()
		}
	}
}

extension LaunchViewController: LaunchViewInput {

}
