//
//  DetailViewController.swift
//  35-semi
//
//  Created by 조성민 on 10/5/24.
//

import UIKit
import SnapKit

final class DetailViewController: BaseViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        return scrollView
    }()
    
    private let scrollViewContentView: UIView = {
        let scrollViewContentView = UIView()
        
        return scrollViewContentView
    }()
    
    private lazy var appCard: AppCard = {
        let appCard = AppCard(image: self.appImage, title: self.appTitle, subtitle: self.appSubtitle)
        
        return appCard
    }()
    
    // 만약 서버가 있으면 id만 받아와서 API 호출하면 됨
    private let appTitle: String
    private let appSubtitle: String
    private let appImage: UIImage
    
    
    init(appTitle: String, appSubtitle: String, appImage: UIImage) {
        self.appTitle = appTitle
        self.appSubtitle = appSubtitle
        self.appImage = appImage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    override func setStyle() {
        view.backgroundColor = .systemBackground
    }
    
    override func setUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContentView)
        [appCard].forEach {
            scrollViewContentView.addSubview($0)
        }
    }
    
    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        scrollViewContentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        appCard.snp.makeConstraints {
            $0.top.equalTo(scrollViewContentView)
            $0.leading.trailing.equalTo(scrollViewContentView)
            $0.height.equalTo(200)
        }
        
        scrollViewContentView.snp.makeConstraints {
            $0.bottom.equalTo(appCard.snp.bottom)
        }
    }
    
}

#Preview
{
    DetailViewController(appTitle: "토스", appSubtitle: "금융이 쉬워진다", appImage: .toss)
}
