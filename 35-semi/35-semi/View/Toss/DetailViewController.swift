//
//  DetailViewController.swift
//  35-semi
//
//  Created by 조성민 on 10/5/24.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("이전 화면으로", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    @objc func backButtonTapped() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}

private extension DetailViewController {
    
    func setStyle() {
        self.view.backgroundColor = .lightGray
    }
    
    func setUI() {
        [].forEach {
//            $0.translatesAutoresizingMaskIntoConstraints = false
//            self.view.addSubview($0)
        }
    }
    
    func setLayout() {
        NSLayoutConstraint.activate(
            [
                
            ]
        )
    }
    
}
