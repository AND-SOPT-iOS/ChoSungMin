//
//  AppDetail.swift
//  35-semi
//
//  Created by 조성민 on 10/17/24.
//

import UIKit
import Foundation

struct AppDetail {
    
    let title: String
    let subtitle: String
    let imageName: String
    let version: String
    let news: String
    let updateDate: Date
    let evaluationCount: Int
    let score: Double
    let ageLimit: Int
    let award: Award
    let explanation: String
    let developer: String
    let bestReviews: [Review]
    
}
