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
    
    private lazy var evaluationSummaryCell: EvaluationSummaryCell = {
        let evaluationSummaryCell = EvaluationSummaryCell(evaluationCount: detail.evaluationCount, score: detail.score)
        
        return evaluationSummaryCell
    }()
    
    private lazy var awardSummaryCell: AwardSummaryCell = {
        let awardSummaryCell = AwardSummaryCell(award: detail.award)
        
        return awardSummaryCell
    }()
    
    private lazy var ageLimitSummaryCell: AgeLimitSummaryCell = {
        let agelimitSummaryCell = AgeLimitSummaryCell(ageLimit: detail.ageLimit)
        
        return agelimitSummaryCell
    }()
    
    private lazy var news: News = {
        let news = News(version: self.detail.version, news: self.detail.news, updateDate: self.detail.updateDate)
        news.delegate = self
        
        return news
    }()
    
    private let previewScreenshot: PreviewScreenshot = {
        let previewScreenshot = PreviewScreenshot()
        
        return previewScreenshot
    }()
    
    private lazy var explanation: Explanation = {
        let explanation = Explanation(explanation: detail.explanation)
        
        return explanation
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
        self.navigationController?.popViewController(animated: true)
    }
    
    override func setStyle() {
        view.backgroundColor = .systemBackground
    }
    
    override func setUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContentView)
        [appCard, summaryStackView, news, previewScreenshot, explanation].forEach {
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
        
        // TODO: previewScreenshot 레이아웃 수정
        previewScreenshot.snp.makeConstraints {
            $0.top.equalTo(news.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(scrollViewContentView)
            $0.height.equalTo(500)
        }
        
        explanation.snp.makeConstraints {
            $0.top.equalTo(previewScreenshot.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(scrollViewContentView)
        }
        
        if let lastView = scrollViewContentView.subviews.last {
            scrollViewContentView.snp.makeConstraints {
                $0.bottom.equalTo(lastView.snp.bottom)
            }
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
            ),
            evaluationCount: 36534,
            score: 4.4,
            ageLimit: 4,
            award: .editorChoice,
            explanation: """
토스뱅크, 토스증권 서비스를 이용하시려면 토스 앱 설치가 필요합니다.

• 내 금융 현황을 한눈에, 홈•소비
• 모든 계좌의 모든 정보를 한 곳에서, 따로 보았던 예적금, 청약, 증권, 대출 계좌의 정보를 한 곳에서 확인할 수 있어요.
• 얼마나 벌고 얼마나 썼을까? 한 달 동안의 수입과 소비를 시간 순으로 모아볼 수 있고, 소비 분석 리포트도 제공해드려요.
• 카드 실적 헷갈릴 필요 없이, 실적을 충족한 카드가 무엇인지 얼마나 더 써야 실적을 달성하는지 한눈에 확인할 수 있어요.
• 매달 고정적으로 나가는 보험비, 생활요금, 구독료 등도 쉽게 확인할 수 있어요.

• 평생 무료로 간편하고 안전하게, 송금
• 송금을 자유롭게, 토스에서는 은행 상관없이 수수료가 평생 무료에요.
• 송금을 안전하게, 송금 전 사기계좌를 미리 조회해 안전하게 송금할 수 있어요.
• 송금을 간편하게, 단 한 번의 터치까지 줄였어요. 최소한의 터치로 송금하세요.
• 그리고 마음까지, 간단한 메시지와 이모티콘을 함께 보내보 세요.
"""
        )
    )
}
