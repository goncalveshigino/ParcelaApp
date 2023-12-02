//
//  extension.swift
//  Calcular
//
//  Created by Goncalves Higino on 17/11/23.
//

import Foundation


extension Double {

    func angolanMoneyFormatWithoutCurrency() -> String {
        return "\(String(format: "%.2f", locale: Locale(identifier: "pt"), self))"
    }
    
}
