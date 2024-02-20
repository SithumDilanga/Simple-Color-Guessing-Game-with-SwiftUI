//
//  ContentView.swift
//  flip card 5 gpt
//
//  Created by Mirissa Wellalage　Tashmika Isuri on 2024/01/15.
//

import SwiftUI


struct ContentView: View {
    private var colors = ["Red", "Blue", "Green", "Yellow", "Orange", "Purple"]
    @State private var selectedColor = "Red"
    @State private var selectedColorIndex = 0
       @State private var showAlert = false
       @State private var alertMessage = ""

    var body: some View {
            VStack {
                Text("Select Your Guess:")
                    .font(.headline)
                Picker("Favorite Color", selection: $selectedColor, content: {
                    ForEach(Array(colors.enumerated()), id: \.element) { i, color in
                        Text(color)
                        }
                    })
                Text("You selected: \(String(describing: selectedColor))")

                Spacer()
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 10) {
                    ForEach(Array(CardModel.colors.enumerated()), id: \.element) { index, color in
                        CardView(color: color, selectedPickerColor: selectedColor, flippedCardIndex: index)
                    }
                }
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Result"),
                    message: Text(alertMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


