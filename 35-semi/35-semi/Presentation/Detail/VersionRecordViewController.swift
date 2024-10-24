//
//  VersionRecordViewController.swift
//  35-semi
//
//  Created by 조성민 on 10/17/24.
//

import UIKit

final class VersionRecordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
