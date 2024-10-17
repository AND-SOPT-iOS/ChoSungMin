//
//  News.swift
//  35-semi
//
//  Created by 조성민 on 10/17/24.
//

import UIKit

final class News: UIView {

    weak var delegate: NewsDelegate?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "새로운 소식"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        
        return label
    }()
    
    private let versionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private lazy var navigationButton: UIButton = {
        let button = UIButton()
        button.setTitle("버전 기록", for: .normal)
        button.setTitleColor(.tintColor, for: .normal)
        button.addTarget(self, action: #selector(navigationButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private let newsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        
        return label
    }()
    
    init(version: String, news: String, updateDate: Date) {
        super.init(frame: .zero)
        setStyle()
        setUI()
        setLayout()
        updateView(
            version: version,
            news: news,
            updateDate: updateDate
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func navigationButtonTapped() {
        delegate?.navigateToRecordViewController()
    }
    
    private func updateView(version: String, news: String, updateDate: Date) {
        versionLabel.text = version
        newsLabel.setLineSpacingText(text: news, 4)
        dateLabel.text = convertDateFormat(date: updateDate)
    }
    
    private func convertDateFormat(date: Date) -> String {
        let diff = Date().timeIntervalSince(date)
        
        switch diff {
        case ..<60:
            return "방금 전"
        case 60..<3600:
            return "\(Int(diff / 60))분 전"
        case 3600..<86400:
            return "\(Int(diff / 3600))시간 전"
        case 86400..<604800:
            return "\(Int(diff / 86400))일 전"
        case 604800..<2592000:
            return "\(Int(diff / 604800))주 전"
        case 2592000..<31536000:
            return "\(Int(diff / 2592000))개월 전"
        default:
            return "\(Int(diff / 31536000))년 전"
        }
    }
    
}

extension News: Presentable {
    
    func setStyle() { }
    
    func setUI() {
        [titleLabel, versionLabel, navigationButton, dateLabel, newsLabel].forEach {
            addSubview($0)
        }
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
        }
        
        versionLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
        
        navigationButton.snp.makeConstraints {
            $0.bottom.equalTo(titleLabel.snp.bottom)
            $0.width.equalTo(80)
            $0.height.equalTo(40)
            $0.trailing.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(navigationButton.snp.bottom).offset(8)
            $0.trailing.equalToSuperview()
        }
        
        newsLabel.snp.makeConstraints {
            $0.top.equalTo(versionLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
}

protocol NewsDelegate: AnyObject {
    
    func navigateToRecordViewController()
    
}

#Preview
{
    News(
        version: "5.183.0",
        news: "- 구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타나면 토스 고객센터를 찾아주세요. 늘 열려있답니다. 365일 24시간 언제든지요.",
        updateDate: Date(
            year: 2024,
            month: 10,
            day: 17,
            hour: 13,
            minute: 31
        )
    )
}
