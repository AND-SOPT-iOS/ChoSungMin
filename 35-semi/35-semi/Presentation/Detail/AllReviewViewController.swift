//
//  AllReviewViewController.swift
//  35-semi
//
//  Created by 조성민 on 10/25/24.
//

import UIKit

final class AllReviewViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
    }

}
