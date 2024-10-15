//
//  AppCard.swift
//  35-semi
//
//  Created by 조성민 on 10/15/24.
//

import UIKit
import SnapKit

final class AppCard: UIView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.numberOfLines = 0
        
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        
        return label
    }()
    
    private let openButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "열기"
        configuration.baseBackgroundColor = .tintColor
        configuration.baseForegroundColor = .white
        configuration.cornerStyle = .capsule
        configuration.contentInsets = .init(top: 8, leading: 24, bottom: 8, trailing: 24)
        let button = UIButton(configuration: configuration)
        
        return button
    }()
    
    private let shareButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: "square.and.arrow.up")
        var button = UIButton(configuration: configuration)
        
        return button
    }()
    
    init(image: UIImage, title: String, subtitle: String) {
        super.init(frame: .zero)
        
        self.imageView.image = image
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AppCard: Presentable {
    
    func setStyle() { }
    
    func setUI() {
        [imageView, titleLabel, subtitleLabel, openButton, shareButton].forEach {
            self.addSubview($0)
        }
    }
    
    func setLayout() {
        imageView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(20)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalTo(imageView.snp.trailing).offset(20)
        }
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        openButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(20)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        shareButton.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(openButton.snp.height)
        }
    }
    
}

#Preview
{
    AppCard(image: .toss, title: "토스", subtitle: "금융이 쉬워진다")
}
