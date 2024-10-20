//
//  ReviewDistribution.swift
//  35-semi
//
//  Created by 조성민 on 10/19/24.
//

import Foundation

struct ReviewDistribution {
    
    private let one: Int
    private let two: Int
    private let three: Int
    private let four: Int
    private let five: Int
    
    init(one: Int, two: Int, three: Int, four: Int, five: Int) {
        self.one = one
        self.two = two
        self.three = three
        self.four = four
        self.five = five
    }
    
    var oneRatio: Double {
        Double(one) / Double(totalCount)
    }
    var twoRatio: Double {
        Double(two) / Double(totalCount)
    }
    var threeRatio: Double {
        Double(three) / Double(totalCount)
    }
    var fourRatio: Double {
        Double(four) / Double(totalCount)
    }
    var fiveRatio: Double {
        Double(five) / Double(totalCount)
    }
    var averageScore: Double {
        let rawScore = Double(one + two * 2 + three * 3 + four * 4 + five * 5) / Double(totalCount)
        return round(rawScore * 10) / 10
    }
    var totalCount: Int {
        one + two + three + four + five
    }
    
}
