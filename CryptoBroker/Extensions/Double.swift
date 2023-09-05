//
//  Double.swift
//  CryptoBroker
//
//  Created by Adewale Sanusi on 05/09/2023.
//

import Foundation

extension Double {
    
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
//        formatter.numberStyle = .none
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter
    }
    
    func toCurrencyWithDecimals() -> String {
        return currencyFormatter.string(for: self) ?? "0.00"
    }
}
