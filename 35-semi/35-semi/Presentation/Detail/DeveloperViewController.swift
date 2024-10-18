//
//  DeveloperViewController.swift
//  35-semi
//
//  Created by 조성민 on 10/19/24.
//

import UIKit

final class DeveloperViewController: UIViewController {

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
