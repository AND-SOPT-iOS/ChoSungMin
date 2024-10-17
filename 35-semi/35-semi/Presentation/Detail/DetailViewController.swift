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
        //TODO: 기본 이미지 추가하기
        let appCard = AppCard(image: UIImage(named: "\(self.detail.imageName)") ?? UIImage.toss, title: self.detail.title, subtitle: self.detail.subtitle)
        
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
    
    private lazy var news: News = {
        let news = News(version: self.detail.version, news: self.detail.news, updateDate: self.detail.updateDate)
        news.delegate = self
        
        return news
    }()
    
    // 만약 서버가 있으면 id만 받아와서 API 호출해서 데이터 바인딩하여 View에 프로퍼티를 놓을 필요 없음.
    private let detail: AppDetail
    
    // TODO: News ViewController를 주입 받아야 할지 결정
    init(detail: AppDetail) {
        self.detail = detail
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
        [appCard, summaryStackView, news].forEach {
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
            $0.top.equalTo(scrollView.contentLayoutGuide)
            $0.leading.trailing.bottom.equalTo(scrollView.contentLayoutGuide).inset(20)
            $0.width.equalTo(scrollView.frameLayoutGuide).inset(20)
        }
        
        appCard.snp.makeConstraints {
            $0.top.equalTo(scrollViewContentView)
            $0.leading.trailing.equalTo(scrollViewContentView)
            $0.height.equalTo(120)
        }
        
        summaryStackView.snp.makeConstraints {
            $0.top.equalTo(appCard.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(96)
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
        
        news.snp.makeConstraints {
            $0.leading.trailing.equalTo(scrollViewContentView)
            $0.top.equalTo(summaryStackView.snp.bottom).offset(20)
            $0.height.equalTo(160)
        }
        
        scrollViewContentView.snp.makeConstraints {
            $0.bottom.equalTo(news.snp.bottom)
        }
    }
    
}

extension DetailViewController: NewsDelegate {
    
    func navigateToRecordViewController() {
        self.navigationController?
            .pushViewController(
                VersionRecordViewController(),
                animated: true
            )
    }
    
}


#Preview
{
    DetailViewController(
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
}
