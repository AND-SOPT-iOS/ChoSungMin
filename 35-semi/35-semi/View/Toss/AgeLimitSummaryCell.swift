//
//  AgeLimitSummaryCell.swift
//  35-semi
//
//  Created by 조성민 on 10/17/24.
//

import UIKit
import SnapKit

final class AgeLimitSummaryCell: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "연령"
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private let ageLimitLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private let generationLabel: UILabel = {
        let label = UILabel()
        label.text = "세"
        label.textColor = .secondaryLabel

        return label
    }()
    
    init(ageLimit: Int) {
        super.init(frame: .zero)
        setStyle()
        setUI()
        setLayout()
        updateView(ageLimit: ageLimit)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateView(ageLimit: Int) {
        ageLimitLabel.text = "\(ageLimit)+"
    }
    
}

extension AgeLimitSummaryCell: Presentable {
    
    func setStyle() { }
    
    func setUI() {
        [titleLabel, ageLimitLabel, generationLabel].forEach {
            addSubview($0)
        }
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalTo(snp.centerX)
            $0.top.equalTo(snp.top)
        }
        ageLimitLabel.snp.makeConstraints {
            $0.centerX.equalTo(snp.centerX)
            $0.centerY.equalTo(snp.centerY)
        }
        generationLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
}

#Preview
{
    let cell = AgeLimitSummaryCell(ageLimit: 10)
    cell.snp.makeConstraints { make in
        make.width.equalTo(100)
        make.height.equalTo(200)
    }
    return cell
}
