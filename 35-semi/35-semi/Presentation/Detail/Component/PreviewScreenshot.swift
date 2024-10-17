//
//  PreviewScreenshot.swift
//  35-semi
//
//  Created by 조성민 on 10/17/24.
//

import UIKit

final class PreviewScreenshot: UIView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .cat
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "미리보기"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.numberOfLines = 0
        
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PreviewScreenshot: Presentable {
    
    func setStyle() { }
    
    func setUI() {
        [titleLabel, imageView].forEach {
            addSubview($0)
        }
    }
    
    // TODO: imageView 오토레이아웃 수정 (Hierarchy 확인)
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        imageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}

#Preview
{
    PreviewScreenshot()
}
