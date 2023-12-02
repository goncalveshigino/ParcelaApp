//
//  KeyBoardView.swift
//  Calcular
//
//  Created by Goncalves Higino on 27/10/23.
//

import SwiftUI

struct KeyBoardView: View {
    var body: some View {
        VStack {
            
            HStack {
                ForEach(1...3, id: \.self) { number in
                    numberButton(number: "\(number)")
                }
            }
            HStack {
                ForEach(4...6, id: \.self) { number in
                    numberButton(number: "\(number)")
                }
            }
            HStack {
                ForEach(7...9, id: \.self) { number in
                    numberButton(number: "\(number)")
                }
            }
            HStack {
                numberButton(number: "0")
                numberButton(number: ".")
                Button {
                    
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
        }
    }
    
    func numberButton(number: String) -> some View {
        Button(action: {
            
        }, label: {
            Text(number)
                .font(.largeTitle)
                      .bold()
                      .frame(width: 80, height: 80)
                      .background(.orange)
                      .foregroundStyle(.white)
                      .clipShape(Circle())
       })
    }
}

#Preview {
    KeyBoardView()
}
