//
//  UILabel+LineSpacing.swift
//  35-semi
//
//  Created by 조성민 on 10/17/24.
//

import UIKit

extension UILabel {
    
    func setLineSpacingText(text: String, _ lineSpacing: CGFloat) {
        let attributedStr = NSMutableAttributedString(string: text)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = lineSpacing
        attributedStr.addAttribute(
            NSAttributedString.Key.paragraphStyle,
            value: style,
            range: NSRange(location: 0, length: attributedStr.length))
        self.attributedText = attributedStr
    }
    
}
