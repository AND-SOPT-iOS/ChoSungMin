//
//  DetailViewController.swift
//  35-semi
//
//  Created by 조성민 on 10/5/24.
//

import UIKit

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
    
    private let summaryStackView: UIStackView = {
        let summaryStackView = UIStackView()
        
        return summaryStackView
    }()
    
    private let evaluationSummaryCell: EvaluationSummaryCell = {
        let evaluationSummaryCell = EvaluationSummaryCell(evaluationCount: 36543, score: 4.4)
        
        return evaluationSummaryCell
    }()
    
    private let awardSummaryCell: AwardSummaryCell = {
        let awardSummaryCell = AwardSummaryCell(award: .editorChoice)
        
        return awardSummaryCell
    }()
    
    private let ageLimitSummaryCell: AgeLimitSummaryCell = {
        let agelimitSummaryCell = AgeLimitSummaryCell(ageLimit: 4)
        
        return agelimitSummaryCell
    }()
    
    // 만약 서버가 있으면 id만 받아와서 API 호출해서 데이터 바인딩하여 View에 프로퍼티를 놓을 필요 없음.
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
        [appCard, summaryStackView].forEach {
            scrollViewContentView.addSubview($0)
        }
        [evaluationSummaryCell, awardSummaryCell, ageLimitSummaryCell].forEach {
            summaryStackView.addArrangedSubview($0)
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
        
        summaryStackView.snp.makeConstraints {
            $0.top.equalTo(appCard.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(96)
        }
        
        scrollViewContentView.snp.makeConstraints {
            $0.bottom.equalTo(summaryStackView.snp.bottom)
        }
        
        evaluationSummaryCell.snp.makeConstraints {
            $0.width.equalTo(appCard.snp.width).multipliedBy(0.33)
        }
        
        awardSummaryCell.snp.makeConstraints {
            $0.width.equalTo(appCard.snp.width).multipliedBy(0.33)
        }
        
        ageLimitSummaryCell.snp.makeConstraints {
            $0.width.equalTo(appCard.snp.width).multipliedBy(0.33)
        }
        
    }
    
}

#Preview
{
    DetailViewController(appTitle: "토스", appSubtitle: "금융이 쉬워진다", appImage: .toss)
}
