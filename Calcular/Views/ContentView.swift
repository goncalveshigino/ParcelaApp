//
//  ContentView.swift
//  Calcular
//
//  Created by Goncalves Higino on 27/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var ticPct = 0
    @State private var numPeople = 1
    @State private var total = "0"
    @State private var calculate = false
    
    
    var canAddDecimal: Bool {
        total.filter({$0 == "."}).count == 0 ? true : false
    }
    
    var canAddDigit: Bool {
        guard let decIndex = total.firstIndex(of: ".") else { return true }
        let index = total.distance(from: total.startIndex, to: decIndex)
        return (total.count - index - 1) < 2
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Text(total)
                    .font(.system(size: 70))
                    .frame(width: 250, alignment: .trailing)
                    .padding(.vertical, 1)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                
                    LazyVGrid(columns: Array(repeating: .init(.fixed(80)), count: 3)){
                        ForEach(1...9, id: \.self) { index in
                            numberButton(number: "\(index)")
                        }
                    }


                HStack {
                    numberButton(number: "0")
                    numberButton(number: ".")
                    Button {
                        if total.count == 1 {
                            total = "0"
                        } else {
                            total.removeLast()
                        }
                    } label: {
                        Image(systemName: "delete.backward.fill")
                            .font(.largeTitle)
                            .bold()
                            .frame(width: 80, height: 80)
                            .background(.gray)
                            .foregroundStyle(.white)
                            .clipShape(Circle())
                    }
                }
                
                HStack {
                    Text("Percentagem")
                    Picker(selection: $ticPct, label: Text("Percentagem")) {
                        ForEach(0...100, id: \.self) { tip in
                            Text("\(tip)%")
                        }
                    }
                    .buttonStyle(.bordered)
                }
                
                HStack {
                    Text("Número de pessoas")
                    Picker(
                        selection: $numPeople,
                        label: Text("Número de pessoas")) {
                        ForEach(1...20, id: \.self) { numPeople in
                            Text("\(numPeople)")
                        }
                    }
                    .buttonStyle(.bordered)
                }
                
                HStack {
                    Button("Calcular") {
                        calculate = true
                    }
                    .sheet(isPresented: $calculate) {
                        TotalsView(total: Double(total) ?? 0, tipPct: ticPct, numPeople: numPeople)
                            .presentationDetents([.medium])
                    }
                    Button("Limpar") {
                       total = "0"
                    }
                }
                .disabled(Double(total) == 0)
                .buttonStyle(.borderedProminent)
                Spacer()
            }
            .navigationTitle("Calcular Parcela")
        }
    }
    
    func addDigit(_ number: String) {
        if canAddDigit {
            if number == "." {
                if canAddDecimal {
                    total += number
                }
            } else {
                total = total == "0" ? number : total + number
            }
        }
    }
    
    
    func numberButton(number: String) -> some View {
        Button(action: {
            addDigit(number)
        }, label: {
            Text(number)
                .font(.largeTitle)
                      .bold()
                      .frame(width: 80, height: 80)
                      .background(.red)
                      .foregroundStyle(.white)
                      .clipShape(Circle())
       })
    }
}

#Preview {
    ContentView()
        .tint(.red)
}
