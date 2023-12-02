//
//  TotalsView.swift
//  Calcular
//
//  Created by Goncalves Higino on 27/10/23.
//

import SwiftUI

struct TotalsView: View {
    let total: Double
    let tipPct: Int
    let  numPeople: Int
    
    var tipAmount: Double {
        total * Double(tipPct)/100
    }
    
    var totalAmount: Double {
        total + tipAmount
    }
    
    var portion: Double {
        totalAmount / Double(numPeople)
    }
    
    
    let identifier = Locale.current.currency?.identifier ?? ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Grid(horizontalSpacing: 20) {
                    GridRow {
                        Text("Valor investido")
                            .gridColumnAlignment(.leading)
                        Text("\(total.angolanMoneyFormatWithoutCurrency())")
                            .gridColumnAlignment(.trailing)
                    }
                    GridRow {
                        Text("Lucro")
                        Text("\(tipAmount.angolanMoneyFormatWithoutCurrency())")
                          
                    }
                    GridRow {
                        Text("Total")
                        Text("\(totalAmount.angolanMoneyFormatWithoutCurrency())")
                            
                    }
                    GridRow {
                        Text("Parcela")
                        Text("\(portion.angolanMoneyFormatWithoutCurrency())")
                           
                    }
                }
                .font(.title)
                .minimumScaleFactor(0.5)
          
                
                Text("🔥")
                    .padding(.top, 100)
                    .font(.system(size: 70))
            }
            .navigationTitle("Valor devido")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    TotalsView(total: 500.70, tipPct: 23, numPeople: 2)
}
