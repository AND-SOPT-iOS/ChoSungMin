//
//  MainViewController.swift
//  35-semi
//
//  Created by 조성민 on 10/5/24.
//

import UIKit

final class MainViewController: BaseViewController {
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Toss 상세화면 보기", for: .normal)
        button.backgroundColor = .tintColor
        button.layer.cornerRadius = 10
        button.setTitleColor(
            .label,
            for: .normal
        )
        button.addTarget(
            self,
            action: #selector(nextButtonTapped), for: .touchUpInside
        )
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
    }
    
    override func setStyle() {
        self.view.backgroundColor = .systemBackground
    }
    
    override func setUI() {
        [nextButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    override func setLayout() {
        NSLayoutConstraint.activate(
            [
                nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                nextButton.heightAnchor.constraint(equalToConstant: 50),
                nextButton.widthAnchor.constraint(equalToConstant: 200)
            ]
        )
    }
    
    @objc
    func nextButtonTapped() {
        let nextViewController = DetailViewController(
            detail: AppDetail(
                title: "토스",
                subtitle: "금융이 쉬원진다",
                imageName: "toss",
                version: "5.183.0",
                news: "- 구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타나면 토스 고객센터를 찾아주세요. 늘 열려있답니다. 365일 24시간 언제든지요.",
                updateDate: Date(
                    year: 2024,
                    month: 9,
                    day: 13
                )
            )
        )
        self.navigationController?.pushViewController(
            nextViewController,
            animated: true
        )
    }
    
}
