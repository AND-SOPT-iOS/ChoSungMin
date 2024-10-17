//
//  EvaluationSummaryCell.swift
//  35-semi
//
//  Created by 조성민 on 10/16/24.
//

import UIKit

final class EvaluationSummaryCell: UIView {
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private let scorelabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private let starStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    init(evaluationCount: Int, score: Double) {
        super.init(frame: .zero)
        setStyle()
        setUI()
        setLayout()
        updateView(evaluationCount: evaluationCount, score: score)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateView(evaluationCount: Int, score: Double) {
        var text = ""
        if evaluationCount >= 10000 {
            let result = Double(evaluationCount) / 10000
            if result == floor(result) {
                text = String(format: "%.0f만", result)
            } else {
                text = String(format: "%.1f만", result)
            }
        } else if evaluationCount >= 1000 {
            let result = Double(evaluationCount) / 1000
            if result == floor(result) {
                text = String(format: "%.0f천", result)
            } else {
                text = String(format: "%.1f천", result)
            }
        } else {
            text = String(evaluationCount)
        }
        countLabel.text = text + "개의 평가"
        scorelabel.text = String(format: "%.1f", score)
        
        setupStars(score: score)
    }
    
    private func setupStars(score: Double) {
        starStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        let fullStars = Int(score)
        let partialStar = score - Double(fullStars)
        
        for i in 0..<5 {
            let starImageView = UIImageView()
            starImageView.tintColor = .secondaryLabel
            starImageView.contentMode = .scaleAspectFit
            if i < fullStars {
                starImageView.image = UIImage(systemName: "star.fill")
            } else if i == fullStars && partialStar > 0 {
                // TODO: Score에 따른 별 비율로 채우기
//                starImageView.image = cropStarImage(percentage: partialStar)
                starImageView.image = UIImage(systemName: "star.leadinghalf.filled")
            } else {
                starImageView.image = UIImage(systemName: "star")
            }
            starStackView.addArrangedSubview(starImageView)
        }
    }
    
}

extension EvaluationSummaryCell: Presentable {
    
    func setStyle() { }
    
    func setUI() {
        [countLabel, scorelabel, starStackView].forEach {
            addSubview($0)
        }
    }
    
    func setLayout() {
        countLabel.snp.makeConstraints {
            $0.centerX.equalTo(snp.centerX)
            $0.top.equalTo(snp.top)
        }
        scorelabel.snp.makeConstraints {
            $0.centerX.equalTo(snp.centerX)
            $0.centerY.equalTo(snp.centerY)
        }
        starStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
}

#Preview
{
    let cell = EvaluationSummaryCell(evaluationCount: 36000, score: 4.4)
    cell.snp.makeConstraints { make in
        make.width.equalTo(100)
        make.height.equalTo(200)
    }
    return cell
}
