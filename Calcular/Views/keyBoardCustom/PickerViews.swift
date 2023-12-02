//
//  PickerViews.swift
//  Calcular
//
//  Created by Goncalves Higino on 27/10/23.
//

import SwiftUI

struct PickerViews: View {
    
    @State private var ticPct = 0
    @State private var numPeople = 1
    
    var body: some View {
        VStack {
            HStack {
                Text("Tip")
                Picker(selection: $ticPct, label: Text("Tip")) {
                    ForEach(0...100, id: \.self) { tip in
                        Text("\(tip)%")
                    }
                }
                .buttonStyle(.bordered)
            }
            
            HStack {
                Text("Number of People")
                Picker(
                    selection: $numPeople,
                    label: Text("Number of People")) {
                    ForEach(1...10, id: \.self) { tip in
                        Text("\(numPeople)")
                    }
                }
                .buttonStyle(.bordered)
            }
        }
    }
}

#Preview {
    PickerViews()
}
