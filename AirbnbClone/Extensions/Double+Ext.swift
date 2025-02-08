//
//  Double+Ext.swift
//  AirbnbClone
//
//  Created by Yasin Özdemir on 7.02.2025.
//

import Foundation

extension Double {
    func toTwoDecimalString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
